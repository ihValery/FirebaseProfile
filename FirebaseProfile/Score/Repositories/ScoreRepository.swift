//
//  ScoreRepository.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 27.06.21.
//

import Combine
import FirebaseFirestore
//FirebaseFirestoreSwift добавляет несколько интересных функций, которые помогут вам интегрировать Firestore с вашими моделями.
//Он позволяет конвертировать Score в документы и документы в Score.
import FirebaseFirestoreSwift

class ScoreRepository: ObservableObject {
    private let path: String = "score"
    private let store = Firestore.firestore()
    
    @Published var scores: [Score] = []
    
    var userId = "noUser"
    private var sessionFirebase = SessionFirebase()
    private var cancellabel: Set<AnyCancellable> = []
    
    init() {
        //Привязать userid от sessionFirebase к репозиторию userId.
        //Он также сохраняет объект, cancellablesчтобы его можно было отменить позже.
        sessionFirebase.$user
            .compactMap { $0?.uid }
            .assign(to: \.userId, on: self)
            .store(in: &cancellabel)
        
        //Этот код наблюдает за изменениями user, использует receive(on:options:) для установки потока, в котором будет выполняться код,
        //а затем присоединяет подписчика с помощью sink(receiveValue:).
        //Это гарантирует, что когда вы получите user для sessionFirebase, код в замыкании будет выполняться в основном потоке.
        sessionFirebase.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.get()
            }
            .store(in: &cancellabel)
    }
    
    private func get() {
        store.collection("users").document(userId).collection(path)
            //Позволяет фильтровать карточки по userId.
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Ошибка при получении карточек: \(error.localizedDescription)")
                    return
                }
                //Используйте compactMap (_ :) on querySnapshot.documents для перебора всех элементов.
                //Если querySnapshotесть nil установите пустой массив.
                self.scores = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Score.self)
                } ?? []
            }
    }
    
    func add(_ score: Score) {
        do {
            var newScore = score
            //Создавая новую карточку, она будет содержать фактический идентификатор пользователя, сгенерированный Firebase.
            newScore.userId = userId
            _ = try store.collection("users").document(userId).collection(path)
                .addDocument(from: newScore)
        } catch {
            fatalError("Невозможно добавить карту: \(error.localizedDescription)")
        }
    }
    
    func update(_ score: Score) {
        guard let scoreId = score.id else { return }
        
        do {
            try store.collection("users").document(userId).collection(path).document(scoreId).setData(from: score)
        } catch {
            fatalError("Невозможно обновить карту: \(error.localizedDescription)")
        }
    }
    
    func remove(_ score: Score) {
        guard let scoreId = score.id else { return }
        
        store.collection("users").document(userId).collection(path).document(scoreId).delete() { error in
            if let error = error {
                fatalError("Невозможно удалить карту: \(error.localizedDescription)")
            }
        }
    }
}

