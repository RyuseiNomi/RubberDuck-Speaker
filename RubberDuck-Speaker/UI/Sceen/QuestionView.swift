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
                    Text("アヒルに話してみましょう")
                        .foregroundColor(Color.gray)
                } else {
                    Text("アヒルが聴いています…")
                        .foregroundColor(Color.gray)
                }
            }
            .padding(EdgeInsets(top: 50, leading: 10, bottom: 20, trailing: 10))
            .frame(maxHeight: UIScreen.main.bounds.height*0.2)
            //.background(Baloon(cornerRadius: 20.0))
            .onAppear(perform:{
                SpeechAudioInteractor(appState: self.appState).requetAuthenticationToUseSpeech()
            })
            
            HStack() {
                /* 人アイコンセクション */
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .imageScale(.large)
                    .background(Color.gray)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                /* 矢印セクション */
                Image(systemName: "chevron.right.2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .imageScale(.large)
                    .background(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                /* アヒル選択セクション */
                Duck()
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            .frame(maxHeight: UIScreen.main.bounds.height*0.3)
            
            /* 録音ボタンセクション */
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
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(maxHeight: UIScreen.main.bounds.height*0.2)
            
            Button(action: {
                self.isShowingImagePicker.toggle()
            }) {
                ButtonLayout(width: 250, pictureName: "photo", buttonText: "自分のアヒルを選択する")
            }
            .sheet(isPresented: $isShowingImagePicker/*, onDismiss: loadImage*/) {
                ImagePicker(isShowingModal: $isShowingImagePicker)
            }
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
    
    //private func loadImage() {
    //    guard let pickedImage = self.appState.pictureObject.pickedImage else { return }
    //
    //}
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
