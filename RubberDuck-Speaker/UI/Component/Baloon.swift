//
//  Baloon.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/13.
//

import SwiftUI

struct Baloon: View {

    private(set) var cornerRadius:CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                Rectangle().foregroundColor(Color(red: 210/255, green: 105/255, blue: 30/255))
                Rectangle().foregroundColor(Color.white)
                    .frame(
                        width: (geometry.size.width) - 20,
                        height: (geometry.size.height) - 20
                    )
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height
            )
            .position(
                x: geometry.size.width - (geometry.size.width/2),
                y: geometry.size.height / 2
            )
        }
    }
}
