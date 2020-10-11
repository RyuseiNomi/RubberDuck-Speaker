//
//  SpeechAudioInteractor.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/11.
//

import Speech

/// Speechを用いた音声認識に関する処理を担うクラス
class SpeechAudioInteractor {
    
    public var appState: AppState
    private(set) var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))

    init(appState: AppState) {
        self.appState = appState
    }
    
    /// 音声認識の利用許可を求める
    public func requetAuthenticationToUseSpeech() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    // 音声入力の許可が出た状態
                    self.appState.audioObject.isEnabledToRecord = true
                case .denied:
                    // 認証を拒否された状態なため、録音ボタンは押せない
                    self.appState.audioObject.isEnabledToRecord = false
                case .restricted:
                    // 一部制限されている状態なため、録音ボタンは押せない
                    self.appState.audioObject.isEnabledToRecord = false
                case .notDetermined:
                    self.appState.audioObject.isEnabledToRecord = false
                @unknown default:
                    print("Unexpected error occured")
                }
            }
        }
    }
    
    /// UIからの録音開始イベントを受け、録音のためのオブジェクトなどを準備する
    public func startRecording() {
        self.createSpeechRecognitionRequest() { error in
            guard let error = error else {
                fatalError("認証リクエストの構築に失敗しました。")
            }
            self.configureAVFoundation()
        }
    }
    
    /// Create a recognition task for the speech recognition session.
    private func createSpeechRecognitionRequest(completion: ((_ error: NSError?)->())?) {
        var error: NSError?
        // 認証オブジェクトの生成
        guard let recognitionRequest = self.appState.audioObject.recognitionRequest else {
            error = "Could not obtain a recognization" as! NSError
            completion?(error)
        }
        recognitionRequest.shouldReportPartialResults = true
        self.appState.audioObject.recognitionRequest = recognitionRequest
        
        // 認証タスクの生成
        self.appState.audioObject.recognitionTask = self.speechRecognizer?.recognitionTask(with: self.appState.audioObject.recognitionRequest!) { result, error in

            if let result = result {
                // 音声認識の結果を随時テキストに反映させる
                self.appState.audioObject.text = result.bestTranscription.formattedString
                self.appState.audioObject.isFinal = result.isFinal
            }
            
            if error != nil || self.appState.audioObject.isFinal {
                self.appState.audioObject.audioEngine.stop()
                self.appState.audioObject.inputNode?.removeTap(onBus: 0)
                
                self.appState.audioObject.recognitionRequest = nil
                self.appState.audioObject.recognitionTask = nil
            }
        }
    }
    
    /// マイクからのinput情報を取得するためにAVAudioSessionからAVAudioEngineを生成する
    private func configureAVFoundation() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("An error occured when configure microphone")
        }
        self.appState.audioObject.inputNode = self.appState.audioObject.audioEngine.inputNode
        
        guard let recordingFormat = self.appState.audioObject.inputNode?.outputFormat(forBus: 0) else {
            fatalError("inputNodeがnilです")
        }
        self.appState.audioObject.inputNode!.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.appState.audioObject.recognitionRequest?.append(buffer)
        }
        
        self.appState.audioObject.audioEngine.prepare()
        do {
            try self.appState.audioObject.audioEngine.start()
        } catch {
            fatalError("An error has occured when prepare to record")
        }
    }
}
