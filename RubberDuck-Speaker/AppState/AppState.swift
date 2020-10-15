//
//  AppState.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/11.
//

import SwiftUI
import Speech

class AppState: ObservableObject {
    
    struct AudioObject {
        /// デバイスのマイクからinput情報を取得するためのオブジェクト
        var audioEngine = AVAudioEngine()
        /// デバイスのオーディオから入力された言葉を認識するためのリクエストオブジェクト
        var recognitionRequest: SFSpeechAudioBufferRecognitionRequest? = SFSpeechAudioBufferRecognitionRequest()
        /// リクエストの実行と、テキストへの変換結果をハンドリングするオブジェクト
        var recognitionTask: SFSpeechRecognitionTask? = nil
        /// 録音タスクが利用可能かどうかを保持する変数
        var isEnabled: Bool = false
        /// 録音中かどうかを保持する変数
        var isRecording: Bool = false
        /// 相談が終了したかどうかを保持する変数
        var isFinished: Bool = false
        /// Speechによって認識された文字を出力してViewに返すための変数
        var text: String = ""
    }
    
    struct SoundObject {
        /// 音楽ファイルを再生するためのオブジェクト
        var audioPlayer: AVAudioPlayer? = AVAudioPlayer()
        /// 音の再生/停止状態を保持する変数
        var isPlaying: Bool = false
        
    }
    
    struct Questions {
        // TODO 質問内容をカスタマイズできるようにする
        var questions:[Question] = [
            Question(question: "今困っていることを\nアヒルに話してみてください", answer: ""),
        ]
        var currentQuestionIndex:Int = 0
    }
    
    @Published public var audioObject = AudioObject()
    @Published public var soundObject = SoundObject()
    @Published public var questions = Questions()
}
