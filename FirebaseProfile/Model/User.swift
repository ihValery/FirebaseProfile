//
//  User.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import Foundation

struct User {
    var uid: String
    var email: String?
    var userName: String?
    var avatarURL: String?
    
    init(uid: String, email: String?, userName: String? = nil, avatarURL: String? = nil) {
        self.uid = uid
        self.email = email
        self.userName = userName
        self.avatarURL = avatarURL
    }
}
