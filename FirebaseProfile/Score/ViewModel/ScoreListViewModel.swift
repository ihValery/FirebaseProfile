//
//  ScoreListViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import Foundation
import Combine

class ScoreListViewModel: ObservableObject {
    @Published private var scoreRepository = ScoreRepository()
    @Published var scoreViewModels: [ScoreViewModel] = []
    private var cancellabel: Set<AnyCancellable> = []
    
    init() {
        scoreRepository.$scores.map { scores in
            scores.map(ScoreViewModel.init)
        }
        .assign(to: \.scoreViewModels, on: self)
        .store(in: &cancellabel)
    }
    
    func add(theme: String, number: String) {
        guard let number = Int(number) else { return }
        
        guard let currentIndex = searchIndex(theme: theme) else {
            let updateScore = Score(theme: theme, maxScore: number)
            scoreRepository.add(updateScore)
            return
        }
        newScoreGreaterOld(number: number, index: currentIndex)
    }
    
    private func update(_ score: Score) {
        scoreRepository.update(score)
    }
    
    private func newScoreGreaterOld(number: Int, index: Int) {
        if number > scoreViewModels[index].score.maxScore {
            var updateScore = scoreViewModels[index].score
            updateScore.maxScore = number
            updateScore.date = Date()
            update(updateScore)
        }
    }
    
    private func searchIndex(theme: String) -> Int? {
        for index in 0..<scoreViewModels.count {
            if scoreViewModels[index].score.theme == theme {
                return index
            }
        }
        return nil
    }
}
