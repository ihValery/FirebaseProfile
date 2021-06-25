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
    @Published var cards: [Score] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Ошибка при получении карточек: \(error.localizedDescription)")
                return
            }
            
            self.cards = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Score.self)
            } ?? []
        }
    }
    
    func add(_ card: Score) {
        do {
            _ = try store.collection(path).addDocument(from: card)
        } catch {
            fatalError("Невозможно добавить карту: \(error.localizedDescription)")
        }
    }
}
