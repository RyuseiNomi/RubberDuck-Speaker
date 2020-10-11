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
        var audioEngine = AVAudioEngine()
        var recognitionRequest: SFSpeechAudioBufferRecognitionRequest? = SFSpeechAudioBufferRecognitionRequest()
        var recognitionTask: SFSpeechRecognitionTask? = SFSpeechRecognitionTask()
        var inputNode: AVAudioInputNode?
        var isEnabledToRecord: Bool = false
        var isFinal:Bool = false
        var text: String = ""
    }
    
    @Published public var audioObject = AudioObject()
}
