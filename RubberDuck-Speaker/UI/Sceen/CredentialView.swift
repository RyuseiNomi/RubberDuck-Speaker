//
//  CredentialView.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/19.
//

import SwiftUI

struct CredentialView: View {
    
    private let icon8Url = URL(string: "https://icons8.com")!
    private let privacyPolicyUrl = URL(string: "https://ryuseinomi.github.io/MakaseteChoice_iOS/")!
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("App version")
                .foregroundColor(Color.gray)
                .font(Font.custom("Helvetica-Light", size: 20))
                .fontWeight(.black)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            Text("1.0.0")
                .foregroundColor(Color.gray)
                .font(Font.custom("Helvetica", size: 20))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 0))
            Text("Credit")
                .foregroundColor(Color.gray)
                .font(Font.custom("Helvetica-Light", size: 20))
                .fontWeight(.black)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            HStack() {
                Text("Icons by ")
                    .foregroundColor(Color.gray)
                Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                    Text("Icons8")
                        .foregroundColor(Color.gray)
                        .underline()
                }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            Text("PrivacyPolicy")
                .foregroundColor(Color.gray)
                .font(Font.custom("Helvetica-Light", size: 20))
                .fontWeight(.black)
                .padding()
            HStack() {
                Text("This app has a ")
                    .foregroundColor(Color.gray)
                Button(action : { UIApplication.shared.open(self.privacyPolicyUrl) }) {
                    Text("privacy policy")
                        .foregroundColor(Color.gray)
                        .underline()
                }
            }
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 224/255, green: 255/255, blue: 255/255)) //lightcyan
    }
}
