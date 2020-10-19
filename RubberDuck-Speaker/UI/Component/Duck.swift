//
//  Duck.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/15.
//

import SwiftUI

struct Duck: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if self.appState.pictureObject.isOriginalDuck {
            Image("Duck")
                .frame(width: 200, height: 200)
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
                .background(Color(red: 135/255, green: 206/255, blue: 250/255)) //lightskyblue
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .shadow(radius: 3)
                )
        } else {
            Image(uiImage: self.appState.pictureObject.pickedImage)
                .resizable()
                .frame(maxWidth: 200, maxHeight: 200)
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        }
    }
}
