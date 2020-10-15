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
        } else {
            AnswerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
