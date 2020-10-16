//
//  RubberDuck_SpeakerApp.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI

@main
struct RubberDuck_SpeakerApp: App {
    let appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)
        }
    }
}
