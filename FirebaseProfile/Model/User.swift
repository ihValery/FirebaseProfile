//
//  User.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String?
    var userName: String?
    var avatarURL: String?
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email
    }
}
