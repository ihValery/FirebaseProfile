//
//  CardViewModel.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 25.06.21.
//

import Combine

class CardViewModel: ObservableObject, Identifiable {
    private let cardRepository = CardRepository()
    @Published var card: Score
    
    private var cancellabel: Set<AnyCancellable> = []
    var id = ""
    
    init(card: Score) {
        self.card = card
        //Настройте привязку cardмежду карточкой idи моделью представления id.
        //Затем сохраните объект, cancellablesчтобы его можно было отменить позже.
        $card
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellabel)
    }
}
