//
//  AuthenticationView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI
import Firebase

struct AuthenticationView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var image = UIImage()
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var session: SessionStore
    @State private var isShowPhotoLibrary = false
    
    var body: some View {
        ZStack {
            Image("bgfile")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    ZStack {
                        Image(uiImage: self.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .clipped()
                            .background(BlurView())
                            .cornerRadius(25)
                       
                    }
                    .onTapGesture {
                        isShowPhotoLibrary = true
                    }
                    .padding()
                    
                    Text(session.errorMessage)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    VStack {
                        TextField("Name", text: $name)
                            .padding(.horizontal).padding(.vertical, 5)
                            .background(BlurView().cornerRadius(25))
                        TextField("Email", text: $email)
                            .padding(.horizontal).padding(.vertical, 5)
                            .background(BlurView().cornerRadius(25))
                        TextField("Password", text: $password)
                            .padding(.horizontal).padding(.vertical, 5)
                            .background(BlurView().cornerRadius(25))
                    }
                    .frame(width: 300)
                }
                .font(.title)
                .padding(40)
                
                VStack(spacing: 10) {
                    Button {
                        session.signIn(email: email, password: password)
                    } label: {
                        Text("Sign In")
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 48)
                            .foregroundColor(.white)
                            .background(BlurView().cornerRadius(25))
                    }
                    
                    Button {
                        session.signUp(email: email, password: password, name: name, photo: image)
                    } label: {
                        Text("Sign Up")
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 48)
                            .foregroundColor(.white)
                            .background(BlurView().cornerRadius(25))
                    }
                }
                .frame(width: 300)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .environmentObject(SessionStore())
    }
}
