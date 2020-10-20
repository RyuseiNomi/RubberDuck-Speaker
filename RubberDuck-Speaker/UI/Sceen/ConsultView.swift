//
//  ConsultView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/19.
//

import SwiftUI

struct ConsultView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack() {
            if !self.appState.audioObject.isFinished {
                QuestionView()
            } else {
                AnswerView()
            }
        }
        .background(Color(red: 224/255, green: 255/255, blue: 255/255)) //lightcyan
    }
}
