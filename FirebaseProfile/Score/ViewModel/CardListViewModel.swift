//
//  CardListViewModel.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 25.06.21.
//

import Combine

class CardListViewModel: ObservableObject {
    @Published var cardRepository = CardRepository()
    
    func add(_ card: Score) {
        cardRepository.add(card)
    }
}
