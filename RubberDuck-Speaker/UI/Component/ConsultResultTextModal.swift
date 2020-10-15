//
//  ConsultResultTextModal.swift
//  RubberDuck-Speaker
//
//  Created by 能美龍星 on 2020/10/15.
//

import SwiftUI

struct ConsultResultTextModal: View {
    
    @Binding var isShowingModal: Bool
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack() {
            Text("アヒルに相談した内容")
                .foregroundColor(Color.gray) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 16))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Text(self.appState.audioObject.text)
                .padding(EdgeInsets(top: 30, leading: 10, bottom: 30, trailing: 10))
            Spacer()
            Button(action: {
                self.isShowingModal.toggle()
            }) {
                Text("OK")
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255)) //white
                    .font(Font.custom("Helvetica-Light", size: 15))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color(red: 255/255, green: 127/255, blue: 80/255))
                    .cornerRadius(10)
                    .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.height*0.3, alignment: .center)
        .background(Color.white)
        .cornerRadius(30)
        .animation(.default)
        .offset(y: self.isShowingModal ? UIScreen.main.bounds.height/6 : UIScreen.main.bounds.height)
    }
}

struct ConsultResultTextModal_Previews: PreviewProvider {
    @State var isShowingModal:Bool = false
    static var previews: some View {
        ConsultResultTextModal(isShowingModal: .constant(true))
    }
}
