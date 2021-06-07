//
//  FirebaseProfile.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import SwiftUI
import Firebase

@main
struct FirebaseProfile: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomView(session: SessionFirebase())
        }
    }
}
