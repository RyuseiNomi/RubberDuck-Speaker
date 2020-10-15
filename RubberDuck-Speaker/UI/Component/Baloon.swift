//
//  Baloon.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/13.
//

import SwiftUI

struct Baloon: View {
    
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            if !self.appState.audioObject.isRecording {
                Text("今困っていることを\nアヒルに話してみてください")
                    .foregroundColor(Color.gray)
            } else {
                Text("聴いています…")
                    .foregroundColor(Color.gray)
            }
            Text(self.appState.audioObject.text)
                .foregroundColor(Color.gray)
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
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BaloonFrame())
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

struct BaloonFrame: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                Rectangle().foregroundColor(Color.gray)
                    .cornerRadius(15.0)
                Rectangle().foregroundColor(Color.white)
                    .frame(
                        width: (geometry.size.width - geometry.size.width/10) - 10,
                        height: (geometry.size.height - geometry.size.height/10) - 10
                    )
                    .cornerRadius(15.0)
            }
            .frame(
                width: geometry.size.width - geometry.size.width/10,
                height: geometry.size.height - geometry.size.height/10
            )
            .position(x: geometry.size.width - (geometry.size.width/2),
                      y: geometry.size.height / 2
            )
        }
    }
}
