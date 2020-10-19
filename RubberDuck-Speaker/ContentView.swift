//
//  ContentView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if !self.appState.audioObject.isFinished {
            QuestionView()
                .edgesIgnoringSafeArea(.all)
                .background(Color(red: 224/255, green: 255/255, blue: 255/255)) //lightcyan
        } else {
            AnswerView()
                .edgesIgnoringSafeArea(.all)
                .background(Color(red: 224/255, green: 255/255, blue: 255/255)) //lightcyan
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
