//
//  QuestionView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI
import Speech

struct QuestionView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                Baloon()
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height - geometry.size.height*0.3)
                Duck()
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height - geometry.size.height*0.7)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
