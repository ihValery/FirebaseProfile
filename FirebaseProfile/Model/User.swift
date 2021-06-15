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
    var score: Score?
    
    //    init(uid: String, email: String?, userName: String? = nil, avatarURL: String? = nil) {
    //        self.uid = uid
    //        self.email = email
    //        self.userName = userName
    //        self.avatarURL = avatarURL
    //    }
}

struct Score: Hashable {
    var theme: String
    var maxScore: Int
    //    var date: Date
}

class ViewModel: ObservableObject {
    @Published var scoreData: [Score] = [Score(theme: "🐘", maxScore: 13),
                                         Score(theme: "🏓", maxScore: 14)]
    
    func add(theme: String, number: Int) {
        
        guard let indexItem = searchIndex(theme: theme) else {
            scoreData.append(Score(theme: theme, maxScore: number))
            return
        }
        
        if number > scoreData[indexItem].maxScore{
            scoreData[indexItem].maxScore = number
        }
//
//        guard let currentScore = scoreData.first?.maxScore else {
//            scoreData.append(Score(theme: theme, maxScore: number))
//            return
//        }
//
//        if number > currentScore {
//            scoreData[0] = Score(theme: theme, maxScore: number)
//        }
    }
    
    private func searchIndex(theme: String) -> Int? {
        for index in 0..<scoreData.count {
            if scoreData[index].theme == theme {
                return index
            }
        }
        return nil
    }
}
