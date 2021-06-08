//
//  WelcomView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI

struct WelcomView: View {
    @ObservedObject var session: SessionFirebase
    
    var body: some View {
        ZStack {
            BeautifulBgUrl(session.user?.avatarURL ?? "")
            
            VStack {
                ImageWithURL(session.user?.avatarURL ?? "")
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                
                VStack {
                    Text(session.user == nil ? "No user" : "Welcome").bold().padding(.bottom, 10)
                    Text(session.user?.userName ?? "")
                    Text(session.user?.email ?? "")
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(BlurViewLight().cornerRadius(25))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                .padding(.vertical)
                
                VStack(spacing: 15) {
                    if session.user == nil {
                        AuthButton(lable: "Sign In/Up") {
                            session.isSignIn = true
                        }
                    } else {
                        AuthButton(lable: "Sign Out") {
                            session.sighOut()
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            session.listen()
        }
        
        .sheet(isPresented: $session.isSignIn) {
            AuthenticationView(session: session)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView(session: SessionFirebase())
    }
}
