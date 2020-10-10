//
//  ContentView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: QuestionView()) {
                HStack {
                    Text("アヒルに相談する")
                        .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255)) //white
                        .font(Font.custom("Helvetica-Light", size: 20))
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                }
                .frame(minWidth: 0, maxWidth: 200, alignment: .center)
                .background(Color(red: 255/255, green: 127/255, blue: 80/255))
                .cornerRadius(10)
                .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
