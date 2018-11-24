//
//  Card.swift
//  RememberMe-1
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import Foundation

class Card {
    
    var emoji: String
    var isUpBySuit: Bool
    
    init(emoji: String, isUpBySuit: Bool = false) {
        self.emoji = emoji
        self.isUpBySuit = isUpBySuit
    }
    
    func flip() {
        isUpBySuit = !isUpBySuit
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.emoji == rhs.emoji
    }
}
