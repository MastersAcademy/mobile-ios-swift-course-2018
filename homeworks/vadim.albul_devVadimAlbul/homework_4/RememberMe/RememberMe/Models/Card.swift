//
//  Card.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/27/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    var isDisabled: Bool {
        return !self.isFaceUp && self.isMatched
    }
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier: Int = getUniqueIdentifier()) {
        self.identifier = identifier
    }
}
