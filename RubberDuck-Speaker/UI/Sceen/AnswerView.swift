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
                // 吹き出し
                HStack() {
                    Duck()
                    .frame(maxHeight: UIScreen.main.bounds.height*0.1, alignment: .center)
                    VStack() {
                        Button(action: {
                            SoundPlayInteractor(appState: self.appState).playSound()
                        }) {
                            Image(systemName: self.getAudioPlayStatus())
                                .resizable()
                                .frame(maxWidth: 60, maxHeight: 60)
                                .imageScale(.large)
                                .foregroundColor(.gray)
                                .background(Color(red: 169/255, green: 169/255, blue: 169/255))
                                .clipShape(Circle())
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width*0.7, maxHeight: UIScreen.main.bounds.height*0.3, alignment: .center)
                    .background(Baloon(cornerRadius: 30.0))
                }
                // ボタン群
                Button(action: {
                    self.appState.audioObject.isFinished.toggle()
                }) {
                    HStack() {
                        Image(systemName: "arrow.counterclockwise")
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 30, maxHeight: 30)
                            .foregroundColor(.white)
                        Text("もう一度相談する")
                            .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255)) //white
                            .font(Font.custom("Helvetica-Light", size: 15))
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    }
                    .frame(minWidth: 0, maxWidth: 250, alignment: .center)
                    .background(Color(red: 255/255, green: 127/255, blue: 80/255))
                    .cornerRadius(10)
                    .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
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
