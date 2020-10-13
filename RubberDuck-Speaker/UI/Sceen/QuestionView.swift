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
                    .frame(maxWidth: 60, maxHeight: 60)
                    .imageScale(.large)
                    .background(self.getButtonColor())
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
        .onAppear(perform:{
            SpeechAudioInteractor(appState: self.appState).requetAuthenticationToUseSpeech()
        })
    }
    
    private func getButtonColor() -> Color {
        if self.appState.audioObject.isRecording {
            return Color(red: 220/255, green: 20/255, blue: 60/255) // crimson
        } else {
            return Color(red: 169/255, green: 169/255, blue: 169/255) // darkgray
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
