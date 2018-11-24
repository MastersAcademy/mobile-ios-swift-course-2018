//
//  Card.swift
//  RememberMe-1
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import Foundation

class Card {
    
    enum CardState {
        case suit
        case shirt
    }
    
    var emoji: String
    var state: CardState
    
    init(emoji: String, state: CardState = .shirt) {
        self.emoji = emoji
        self.state = state
    }
    
    func flip() {
        switch state {
        case .suit:
            state = .shirt
        case .shirt:
            state = .suit
        }
    }
}
