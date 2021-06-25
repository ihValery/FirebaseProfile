//
//  CardRepository.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 25.06.21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class CardRepository: ObservableObject {
    private let path: String = "cardsScore"
    private let store = Firestore.firestore()
    
    func add(_ card: Score) {
        do {
            _ = try store.collection(path).addDocument(from: card)
        } catch {
            fatalError("Невозможно добавить карту: \(error.localizedDescription)")
        }
    }
}
