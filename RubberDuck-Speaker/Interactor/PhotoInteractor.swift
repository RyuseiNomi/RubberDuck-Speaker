//
//  PhotoInteractor.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/15.
//

import SwiftUI

/// デフォルトのアヒルを変更するために、デバイスから画像を選択する際のアプリ内で共有する画像データの更新を行うクラス
class PhotoInteractor: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private(set) var appState: AppState
    private let parent: ImagePicker
    
    init(appState: AppState, parent: ImagePicker) {
        self.appState = appState
        self.parent = parent
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.appState.pictureObject.imagePickerController!.sourceType = .photoLibrary
        }
        if let uiImage = info[.originalImage] as? UIImage {
            self.appState.pictureObject.pickedImage = uiImage
        }
        // この時点でデフォルトのアヒルの画像が選択されていない状態になるため、EnvironmentObjectの値を変更する
        if self.appState.pictureObject.isOriginalDuck {
            self.appState.pictureObject.isOriginalDuck = false
        }
        self.parent.isShowingModal.toggle()
    }
}
