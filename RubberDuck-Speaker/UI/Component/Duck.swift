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
        Button(action: {
            SoundPlayInteractor(appState: self.appState).playSound()
        }) {
            if self.appState.pictureObject.isOriginalDuck {
                Image("Duck")
                    .frame(maxWidth: 100, maxHeight: 100)
                    .imageScale(.large)
            } else {
                Image(uiImage: self.appState.pictureObject.pickedImage)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .imageScale(.large)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
