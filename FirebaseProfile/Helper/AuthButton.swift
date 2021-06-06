//
//  AuthButton.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 6.06.21.
//

import SwiftUI

struct AuthButton: View {
    let lable: String
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(lable)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .foregroundColor(.white)
                .background(BlurViewLight().cornerRadius(25))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
        }
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(lable: "Sign In") {}
    }
}