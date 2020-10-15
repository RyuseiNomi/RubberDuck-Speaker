//
//  AnswerView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI

struct AnswerView: View {
    
    var body: some View {
            VStack() {
                Group {
                    VStack() {
                        Text("アヒルからの答えを聞く")
                            .foregroundColor(Color.gray)
                        Button(action: {
                            Text("tapped")
                        }) {
                            Image(systemName: "dot.radiowaves.right")
                                .frame(maxWidth: 60, maxHeight: 60)
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .background(Color(red: 169/255, green: 169/255, blue: 169/255))
                                .clipShape(Circle())
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    .frame(width: 200, height: 100, alignment: .center)
                    .background(Baloon(cornerRadius: 30.0))
                }
                Duck()
            }
    }
}
