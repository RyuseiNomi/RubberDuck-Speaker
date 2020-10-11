//
//  QuestionView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI
import Speech

struct QuestionView: View {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            Text("相談する")
            if self.appState.audioObject.isEnabledToRecord {
                if self.appState.audioObject.isFinal {
                    Button(action: {
                        SpeechAudioInteractor(appState: self.appState).startRecording()
                    }) {
                        Text("相談を開始する")
                    }
                } else {
                    Text(self.appState.audioObject.text)
                }
            }
        }
        .onAppear(perform:{
            SpeechAudioInteractor(appState: self.appState).requetAuthenticationToUseSpeech()
        })
    }
}
