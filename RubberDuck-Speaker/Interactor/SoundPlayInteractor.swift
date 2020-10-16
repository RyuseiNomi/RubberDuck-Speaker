//
//  SoundPlayInteractor.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/15.
//

import SwiftUI
import AVFoundation

class SoundPlayInteractor {
    
    public var appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    public func playSound() {
        guard let filepath = Bundle.main.path(forResource: "duck", ofType: "mp3") else {
            fatalError("Can not find a sound file")
        }
        
        if self.appState.soundObject.isPlaying {
            self.appState.soundObject.audioPlayer!.stop()
            self.appState.soundObject.isPlaying.toggle()
        } else {
            do {
                self.appState.soundObject.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filepath))
                self.appState.soundObject.audioPlayer!.play()
                self.appState.soundObject.isPlaying.toggle()
            } catch {
                fatalError("Error in occured while playing a sound file")
            }
        }
    }
}
