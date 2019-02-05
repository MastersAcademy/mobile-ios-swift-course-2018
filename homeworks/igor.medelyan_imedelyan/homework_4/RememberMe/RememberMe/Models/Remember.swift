//
//  Remember.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/27/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import Foundation

class Remember {
    var cards = [Card]()
    var flips = 0
    var score = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        Card.identifierFactory = 0
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        flips = areAllCardsMatched() ? flips : flips + 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    score -= 1
                }
                
                // check if game is over
                if areAllCardsMatched() {
                    cards[matchIndex].isFaceUp = false
                    cards[index].isFaceUp = false
                } else {
                    cards[index].isFaceUp = true
                }
                
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
    
    private func areAllCardsMatched() -> Bool {
        var allMatched = true
        cards.forEach {
            if !$0.isMatched {
                allMatched = false
            }
        }
        return allMatched
    }
}
