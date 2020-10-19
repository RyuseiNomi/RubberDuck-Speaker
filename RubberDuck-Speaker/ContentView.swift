//
//  ContentView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/10.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    @State private(set) var isShowingCredential: Bool = false
    
    var body: some View {
        TabView {
            ConsultView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                    Text("相談")
                }
            CredentialView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .resizable()
                        .scaledToFit()
                    Text("設定")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
