//
//  Button.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/15.
//

import SwiftUI

struct ButtonLayout: View {
    
    public var width: CGFloat
    public var pictureName: String
    public var buttonText: String
    
    var body: some View {
        HStack() {
            Image(systemName: pictureName)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 30, maxHeight: 30)
                .foregroundColor(.white)
            Text(buttonText)
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255)) //white
                .font(Font.custom("Helvetica-Light", size: 15))
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .frame(minWidth: 0, maxWidth: width, alignment: .center)
        .background(Color(red: 255/255, green: 127/255, blue: 80/255))
        .cornerRadius(10)
        .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}
