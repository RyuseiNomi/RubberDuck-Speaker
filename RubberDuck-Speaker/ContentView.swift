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
                .background(Color(red: 144/255, green: 238/255, blue: 144/255))
        } else {
            AnswerView()
                .edgesIgnoringSafeArea(.all)
                .background(Color(red: 144/255, green: 238/255, blue: 144/255))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
