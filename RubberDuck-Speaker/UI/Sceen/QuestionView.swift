//
//  QuestionView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI
import Speech

struct QuestionView: View {
    
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            VStack() {
                if !self.appState.audioObject.isRecording {
                    Text("今困っていることを")
                        .foregroundColor(Color.gray)
                    Text("アヒルに話してみましょう")
                        .foregroundColor(Color.gray)
                } else {
                    Text("アヒルが聴いています…")
                        .foregroundColor(Color.gray)
                }
                Button(action: {
                    SpeechAudioInteractor(appState: self.appState).recordButtonTapped()
                }) {
                    Image(systemName: "mic")
                        .frame(maxWidth: 70, maxHeight: 70)
                        .imageScale(.large)
                        .background(self.getButtonColor())
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 50, leading: 10, bottom: 20, trailing: 10))
            .frame(maxWidth: UIScreen.main.bounds.width*0.8, maxHeight: UIScreen.main.bounds.height*0.35)
            .background(Baloon(cornerRadius: 20.0))
            .onAppear(perform:{
                SpeechAudioInteractor(appState: self.appState).requetAuthenticationToUseSpeech()
            })
            Duck()
                .frame(maxHeight: UIScreen.main.bounds.height*0.4)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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
