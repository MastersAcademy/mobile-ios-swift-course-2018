//
//  Card.swift
//  RememberMe
//
//  Created by Myhovych on 02/12/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier: Int = getUniqueIdentifier()) {
        self.identifier = identifier
    }
}
