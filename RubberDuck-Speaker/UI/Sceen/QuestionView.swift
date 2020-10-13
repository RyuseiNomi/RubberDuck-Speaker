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
            Text(self.appState.audioObject.text)
            Button(action: {
                SpeechAudioInteractor(appState: self.appState).recordButtonTapped()
            }) {
                Image(systemName: "mic")
            }
            .frame(minWidth: 0, maxWidth: 200, alignment: .center)
            .background(Color(red: 255/255, green: 127/255, blue: 80/255))
            .cornerRadius(10)
            .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
        }
        .onAppear(perform:{
            SpeechAudioInteractor(appState: self.appState).requetAuthenticationToUseSpeech()
        })
    }
}
