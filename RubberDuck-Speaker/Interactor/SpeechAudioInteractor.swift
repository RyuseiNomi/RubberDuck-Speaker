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
    /// Speechライブラリが利用可能かどうかを示すためのオブジェクト
    private(set) var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))
    /// オーディオからの入力とシステムを接続するノードオブジェクト
    private(set) var inputNode: AVAudioInputNode?

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
                    self.appState.audioObject.isEnabled = true
                case .denied:
                    // 認証を拒否された状態なため、録音ボタンは押せない
                    self.appState.audioObject.isEnabled = false
                case .restricted:
                    // 一部制限されている状態なため、録音ボタンは押せない
                    self.appState.audioObject.isEnabled = false
                case .notDetermined:
                    self.appState.audioObject.isEnabled = false
                @unknown default:
                    fatalError("Unexpected error occured")
                }
            }
        }
    }
    
    public func recordButtonTapped() {
        if self.appState.audioObject.audioEngine.isRunning {
            self.appState.audioObject.audioEngine.stop()
            self.appState.audioObject.recognitionRequest?.endAudio()
            self.appState.audioObject.isEnabled = false
            self.appState.audioObject.isRecording = false
        } else {
            do {
                try self.startRecording()
                self.appState.audioObject.isRecording = true
            } catch {
                fatalError("error has occured")
            }
        }
    }
    
    /// 録音を開始する
    private func startRecording() {
        // 録音開始前に、以前のタスクをnilにする
        self.appState.audioObject.recognitionTask?.cancel()
        self.appState.audioObject.recognitionTask = nil
    
        // AudioSessionの生成、認証タスクの作成、AudioEngineの生成を行う
        self.configureAVAudioSession()
        self.buildSpeechRecognitionRequest()
        self.buildSpeechRecognitionTask()
        self.configureAVFoundation()
    }
    
    /// AVAudioSessionの構築を行う
    private func configureAVAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            fatalError("Could not detect a microphone from your device")
        }
        self.inputNode = self.appState.audioObject.audioEngine.inputNode
    }
    
    /// 認証オブジェクトの生成を行う
    private func buildSpeechRecognitionRequest() {
        guard let recognitionRequest = self.appState.audioObject.recognitionRequest else {
            fatalError("Could not get a SFSpeechAudioBufferRecognitionRequest.")
        }
        recognitionRequest.shouldReportPartialResults = true
        self.appState.audioObject.recognitionRequest = recognitionRequest
    }
    
    /// Speechの認識タスクの生成を行う
    private func buildSpeechRecognitionTask() {
        var isFinal:Bool = false
        // 認証タスクの生成
        self.appState.audioObject.recognitionTask = self.speechRecognizer?.recognitionTask(with: self.appState.audioObject.recognitionRequest!) { result, error in

            if let result = result {
                // 音声認識の結果を随時テキストに反映させる
                self.appState.audioObject.text = result.bestTranscription.formattedString
                isFinal = result.isFinal
            }
            
            if error != nil || isFinal {
                print("stopped")
                self.appState.audioObject.audioEngine.stop()
                self.inputNode?.removeTap(onBus: 0)
                
                //self.appState.audioObject.recognitionRequest = nil
                self.appState.audioObject.recognitionTask = nil
                self.appState.audioObject.isEnabled = true
            }
        }
    }
    
    /// マイクからのinput情報を取得するためにAVAudioSessionからAVAudioEngineを生成する
    private func configureAVFoundation() {
        guard let recordingFormat = self.inputNode?.outputFormat(forBus: 0) else {
            fatalError("Could not detect InputNode from AVAudiosession")
        }
        self.inputNode!.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.appState.audioObject.recognitionRequest?.append(buffer)
        }
        
        self.appState.audioObject.audioEngine.prepare()
        do {
            try self.appState.audioObject.audioEngine.start()
            self.appState.audioObject.text = ""
        } catch {
            fatalError("An error has occured when prepare to record")
        }
    }
}
