//
//  Remember.swift
//  RememberMe
//
//  Created by Myhovych on 02/12/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation

class Remember {
    var cards = [Card]()
    var score = 0
    var flips = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flips += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    score -= 1
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

    func newGame() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
        score = 0
        flips = 0
        cards.shuffle()
    }
}
