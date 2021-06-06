//
//  WelcomView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI
//import Firebase

struct WelcomView: View {
    @EnvironmentObject var session: SessionStore
    @State private var image = UIImage()
    
    var body: some View {
        ZStack {
            BeautifulBackground(image: $image)
            
            
            VStack {
                FrameAvatarData(data: $session.avatarData)
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
//                Image(uiImage: UIImage(data: self.session.avatarData) ?? UIImage())
                
                VStack {
                    Text(session.user == nil ? "" : "Welcome back").bold().padding(.bottom, 10)
                    Text(session.userName)
                    Text(session.user?.email ?? "")
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(BlurViewLight().cornerRadius(25))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                .padding(.vertical)
                
                VStack(spacing: 15) {
                    AuthButton(lable: "download Avatar") {
                        session.downloadAvatar()
                    }
                    AuthButton(lable: "Sign Out") {
                        session.sighOut()
                    }
                    .disabled(session.user == nil)
                    .opacity(session.user == nil ? 0 : 1)
                }
            }
            .padding()
        }
        .onAppear {
            session.listen()
        }
        
        .sheet(isPresented: $session.isSignIn) {
            AuthenticationView()
                .environmentObject(SessionStore())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
            .environmentObject(SessionStore())
    }
}
