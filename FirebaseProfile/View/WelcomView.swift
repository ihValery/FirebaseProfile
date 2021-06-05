//
//  WelcomView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct WelcomView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        ZStack {
            Image("bgfile")
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                ImagePreview()
                
                VStack {
                    VStack {
                        Text("Hello user").bold()
                        Text(session.userName)
                        Text(session.user?.email ?? "")
                    }
                    .frame(width: 300, height: 200)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(BlurView().cornerRadius(25))
                    .padding(.vertical)
                    
                    Button {
                        session.sighOut()
                    } label: {
                        Text("Sign Out")
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 48)
                            .foregroundColor(.white)
                            .background(BlurView().cornerRadius(25))
                            .frame(width: 300)
                    }
                    .disabled(session.user == nil)
                    .opacity(session.user == nil ? 0 : 1)
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            session.listen()
        }
        
        .sheet(isPresented: $session.isSignIn) {
            AuthenticationView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
            .environmentObject(SessionStore())
    }
}
