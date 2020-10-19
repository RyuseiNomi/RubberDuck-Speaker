//
//  AnswerView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI

struct AnswerView: View {
    
    @State var isShowingModal: Bool = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack() {
            VStack() {
                VStack() {
                    Text("相談した内容")
                        .font(Font.custom("Helvetica-Light", size: 20))
                        .foregroundColor(Color.gray)
                    ScrollView {
                        Text(self.appState.audioObject.text)
                            .font(Font.custom("Helvetica-Light", size: 15))
                            .foregroundColor(Color.gray)
                            .lineLimit(nil)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width*0.85, maxHeight: UIScreen.main.bounds.height*0.4)
                }
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height*0.5)
                .background(Baloon(cornerRadius: 10.0))
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                Duck()
                    .frame(maxHeight: UIScreen.main.bounds.height*0.1, alignment: .center)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                Button(action: {
                    self.appState.audioObject.isFinished.toggle()
                }) {
                    ButtonLayout(width: 250, pictureName: "arrow.counterclockwise", buttonText: "もう一度相談する")
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
    
    private func getAudioPlayStatus() ->String {
        if self.appState.soundObject.isPlaying {
            return "pause.circle.fill"
        } else {
            return "play.circle.fill"
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
