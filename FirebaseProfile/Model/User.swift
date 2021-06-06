//
//  User.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

import Foundation

class User {
    var uid: String
    var email: String?
    var userName: String?
    var avatarURL: URL?
    
    init(uid: String, email: String?, userName: String?, avatarURL: URL?) {
        self.uid = uid
        self.email = email
        self.userName = userName
        self.avatarURL = avatarURL
    }
}
