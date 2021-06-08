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
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(BlurViewLight().cornerRadius(25))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
        }
    }
}
