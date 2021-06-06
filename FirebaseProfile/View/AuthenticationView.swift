//
//  AuthenticationView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI
import Firebase

struct AuthenticationView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var image = UIImage()
    @State private var isShowPhotoLibrary = false
    
    @Environment (\.presentationMode) private var presentationMode
    @EnvironmentObject private var session: SessionStore
    
    var body: some View {
        ZStack {
            BeautifulBackground(image: $image)
            
            VStack {
                FrameAvatar(image: $image)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    
                    .onTapGesture {
                        isShowPhotoLibrary = true
                    }
                
                Text(session.errorMessage)
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                VStack {
                    AuthTextField(name: "Name", field: $name)
                    AuthTextField(name: "Email", field: $email)
                    AuthTextField(name: "Password", field: $password)
                }
                .padding(.vertical, 40)
                
                VStack(spacing: 15) {
                    AuthButton(lable: "Sign In") {
                        session.signIn(email: email, password: password)
                    }
                    AuthButton(lable: "Sign Up") {
                        session.signUp(email: email, password: password, name: name, photo: image)
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthenticationView()
                .environmentObject(SessionStore())
        }
    }
}
