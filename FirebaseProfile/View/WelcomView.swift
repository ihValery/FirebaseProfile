//
//  WelcomView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI
import Firebase

struct WelcomView: View {
    @EnvironmentObject var session: SessionStore

    var body: some View {
        ZStack {
            Image("bgfile")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
//                FrameAvatar()
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .foregroundColor(.gray).opacity(0.9)
//                    .frame(width: 300, height: 300)
//                    .clipped()
//                    .background(BlurViewLight())
//                    .cornerRadius(25)
//                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                
                VStack {
                    VStack {
                        Text(session.user == nil ? "" : "Welcome back").bold()
                        Text(session.userName)
                        Text(session.user?.email ?? "")
                    }
                    .frame(width: 300, height: 200)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(BlurViewLight().cornerRadius(25))
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                    .padding(.vertical)
                    
                    VStack {
                        Button {
//                            session.downloadAvatar()
                        } label: {
                            Text("download Avatar")
                                .font(.title)
                                .frame(maxWidth: .infinity, maxHeight: 48)
                                .foregroundColor(.white)
                                .background(BlurViewLight().cornerRadius(25))
                                .frame(width: 300)
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                        }
                    }
                    .padding(.vertical)
                    
                    
                    VStack {
                        Button {
                            session.sighOut()
                        } label: {
                            Text("Sign Out")
                                .font(.title)
                                .frame(maxWidth: .infinity, maxHeight: 48)
                                .foregroundColor(.white)
                                .background(BlurViewLight().cornerRadius(25))
                                .frame(width: 300)
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 1))
                        }
                        .disabled(session.user == nil)
                        .opacity(session.user == nil ? 0 : 1)
                        .padding(.horizontal)
                    }
                }
            }
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
