//
//  Remember.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/27/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import Foundation

class Remember: NSObject {
    
    struct GameProperties {
        let bonusScore: Int
        let mistakeScore: Int
        
        static var `default`: GameProperties {
            return GameProperties(bonusScore: 2, mistakeScore: 1)
        }
    }
    
    var cards = [Card]()
    @objc dynamic var score: Int = 0
    @objc dynamic var flips: Int = 0
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
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += properties.bonusScore
                } else {
                    score -= properties.mistakeScore
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // If no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func restart() {
        for index in 0..<cards.count {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        score = 0
        cards.shuffle()
    }
    
   
}
