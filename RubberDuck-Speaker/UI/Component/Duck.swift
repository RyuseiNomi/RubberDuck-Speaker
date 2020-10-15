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
            Image("Duck")
                .frame(maxWidth: 100, maxHeight: 100)
                .imageScale(.large)
        }
    }
}
