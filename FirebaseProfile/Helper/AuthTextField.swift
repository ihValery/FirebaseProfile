//
//  AuthTextField.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 6.06.21.
//

import SwiftUI

struct AuthTextField: View {
    let name: String
    @Binding var field: String
    
    var body: some View {
        TextField(name, text: $field)
            .padding(.horizontal).padding(.vertical, 5)
            .background(BlurViewLight().cornerRadius(25))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
            .font(.title)
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(name: "user name", field: .constant("temp"))
    }
}
