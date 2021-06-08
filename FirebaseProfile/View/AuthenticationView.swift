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

    @ObservedObject var session: SessionFirebase
    
    var body: some View {
        ZStack {
            BeautifulBg(image: $image)
            
            VStack {
                VStack {
                    Spacer()
                    FrameAvatar(image: $image)
                        .onTapGesture {
                            isShowPhotoLibrary = true
                        }
                }
                
                VStack {
                    Text(session.errorMessage)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    VStack {
                        AuthTextField(name: "Name", field: $name)
                        AuthTextField(name: "Email", field: $email)
                        AuthTextField(name: "Password", field: $password)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        AuthButton(lable: "Sign In") {
                            session.signIn(email: email, password: password)
                        }
                        AuthButton(lable: "Sign Up") {
                            session.signUp(email: email, password: password, name: name, photo: image)
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthenticationView(session: SessionFirebase())
        }
    }
}
