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
    
    init(uid: String, email: String?, userName: String?) {
        self.uid = uid
        self.email = email
        self.userName = userName
    }
}
