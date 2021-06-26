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

struct Score: Identifiable, Codable {
    var id: String?
    var theme: String
    var maxScore: Int
    var date = Date()
    var userId: String?
}

//class ViewModel: ObservableObject {
//    @Published var scoreData: [Score] = [Score(theme: "🐘", maxScore: 13, date: Date(timeIntervalSince1970: 1623323920))]
//    
//    func add(theme: String, number: Int) {
//        guard let indexItem = searchIndex(theme: theme) else {
//            scoreData.append(Score(theme: theme, maxScore: number))
//            return
//        }
//        
//        if number > scoreData[indexItem].maxScore{
//            scoreData[indexItem].maxScore = number
//            scoreData[indexItem].date = Date()
//        }
//    }
//    
//    private func searchIndex(theme: String) -> Int? {
//        for index in 0..<scoreData.count {
//            if scoreData[index].theme == theme {
//                return index
//            }
//        }
//        return nil
//    }
//}
