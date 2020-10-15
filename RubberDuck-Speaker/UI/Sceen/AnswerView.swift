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
            Text("アヒルからの答えを聞く")
                .foregroundColor(Color.gray)
            Duck()
        }
    }
}
