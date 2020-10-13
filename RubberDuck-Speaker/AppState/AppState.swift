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
        /// リクエストや録音開始・終了に伴うオーディオからの入力受付を示すステータス
        var isEnabled: Bool = false
        /// Speechによって認識された文字を出力してViewに返すための変数
        var text: String = ""
    }
    
    @Published public var audioObject = AudioObject()
}
