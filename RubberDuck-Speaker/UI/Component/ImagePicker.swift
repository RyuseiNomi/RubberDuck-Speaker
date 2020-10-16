//
//  ImagePicker.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/16.
//

import SwiftUI

/// デバイスから画像を選択するための一時的なモーダル
struct ImagePicker: UIViewControllerRepresentable {
    
    @EnvironmentObject var appState: AppState
    @Binding var isShowingModal:Bool
    
    func makeCoordinator() -> PhotoInteractor {
        PhotoInteractor(appState: self.appState, parent: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
