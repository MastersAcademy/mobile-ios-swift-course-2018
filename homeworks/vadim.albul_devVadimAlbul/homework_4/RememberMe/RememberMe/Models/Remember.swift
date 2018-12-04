//
//  Remember.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/27/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import Foundation

class Remember {
    
    struct GameProperties {
        let bonusScore: Int
        let mistakeScore: Int
        
        static var `default`: GameProperties {
            return GameProperties(bonusScore: 2, mistakeScore: 1)
        }
    }
    
    var cards = [Card]()
    var score: Observable<Int> = Observable(0)
    var flips: Observable<Int> = Observable(0)
    var isCardFaceChanged: Bool = false
    
    private let properties: GameProperties = .default
    var isGameEnded: Bool {
        if !cards.isEmpty {
            return cards.filter({!$0.isMatched}).isEmpty
        }
        return false
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        guard !cards[index].isMatched else {
            isCardFaceChanged = false
            return
        }
        
        if let matchIndex = indexOfOneAndOnlyFaceUpCard {
            if matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score.value += properties.bonusScore
                } else {
                    score.value -= properties.mistakeScore
                }
                flips.value += 1
                isCardFaceChanged = true
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                isCardFaceChanged = false
            }
        } else {
            // If no card or two cards face up
            for flipdownIndex in cards.indices {
                cards[flipdownIndex].isFaceUp = false
            }
            flips.value += 1
            isCardFaceChanged = true
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    func restart() {
        for index in 0..<cards.count {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        score.value = 0
        cards.shuffle()
    }
    
   
}
