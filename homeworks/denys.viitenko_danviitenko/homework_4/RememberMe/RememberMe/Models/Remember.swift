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
    var score = 0
    var flipsCount = 0
    var indexOfOneAndOnlyFaceUpCard: Int?
    var matched = 0
    
    init(numberOfPairsOfCards: Int) {
        var shuffleCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            shuffleCards += [card,card]
        }
        for _ in shuffleCards {
            let randomCard = shuffleCards.remove(at: Int.random(in: 0..<shuffleCards.count))
            cards.append(randomCard)
        }
    }
    
    func removeCards(){
        cards.removeAll()
    }
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Verify if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    matched = -1
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                matched += 1
            } else {
                // If no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
                print(matched)
                if matched == 1 {
                    self.score -= 1
                    self.matched = 0
                }
            }
            flipsCount += 1
            
        }
    }
}
