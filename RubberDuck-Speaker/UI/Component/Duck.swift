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
                .frame(width: 100, height: 100)
                .imageScale(.large)
        } else {
            Image(uiImage: self.appState.pictureObject.pickedImage)
                .resizable()
                .frame(maxWidth: 200, maxHeight: 200)
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
        }
    }
}
