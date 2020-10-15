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
                Rectangle().foregroundColor(Color.gray)
                    .cornerRadius(cornerRadius)
                Rectangle().foregroundColor(Color.white)
                    .frame(
                        width: (geometry.size.width - geometry.size.width/10) - 10,
                        height: (geometry.size.height - geometry.size.height/10) - 10
                    )
                    .cornerRadius(cornerRadius)
            }
            .frame(
                width: geometry.size.width - geometry.size.width/10,
                height: geometry.size.height - geometry.size.height/10
            )
            .position(x: geometry.size.width - (geometry.size.width/2),
                      y: geometry.size.height / 2
            )
        }
    }
}
