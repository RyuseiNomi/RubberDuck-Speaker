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
    @State private(set) var isShowingImagePicker: Bool = false
    
    var body: some View {
        VStack() {
            /* 見出しセクション */
            VStack() {
                if !self.appState.audioObject.isRecording {
                    Text("今困っていることを")
                        .foregroundColor(Color.gray)
                        .font(Font.custom("Helvetica-Light", size: 20))
                    Text("アヒルに話してみましょう")
                        .foregroundColor(Color.gray)
                        .font(Font.custom("Helvetica-Light", size: 20))
                }
            }
            .padding(EdgeInsets(top: 50, leading: 10, bottom: 20, trailing: 10))
            .frame(maxHeight: UIScreen.main.bounds.height*0.2)
            .onAppear(perform:{
                SpeechAudioInteractor(appState: self.appState).requetAuthenticationToUseSpeech()
            })
            
            /* アヒル選択セクション */
            Button(action: {
                self.isShowingImagePicker.toggle()
            }) {
                Duck()
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(maxHeight: UIScreen.main.bounds.height*0.3)
                    .overlay(
                        Image(systemName: "photo.fill")
                            .frame(maxWidth: 50, maxHeight: 50)
                            .foregroundColor(.white)
                            .background(Color(red: 143/255, green: 188/255, blue: 143/255)) // darkseagreen
                            .clipShape(Circle()),
                        alignment: .bottomTrailing
                    )
            }
            .sheet(isPresented: $isShowingImagePicker/*, onDismiss: loadImage*/) {
                ImagePicker(isShowingModal: $isShowingImagePicker)
            }
            
            /* 録音ボタンセクション */
            Button(action: {
                SpeechAudioInteractor(appState: self.appState).recordButtonTapped()
            }) {
                Image(systemName: "mic")
                    .frame(maxWidth: 100, maxHeight: 100)
                    .imageScale(.large)
                    .background(self.getButtonColor())
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            .shadow(radius: 3)
                    )
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
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
