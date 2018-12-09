//
//  Emoji.swift
//  RememberMe
//
//  Created by Myhovych on 02/12/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation

enum Emoji: Int, CaseIterable {
    
    case fruits = 1
    case faces
    case sportGames
    case animals
    case cars
    case food
    
    func available() -> [String] {
        switch self {
        case .fruits:
            return ["🍏", "🍊", "🍋", "🍌", "🍓", "🍒", "🥥", "🍍", "🥝"]
        case .faces:
            return ["😁", "🤪", "🥰", "🤓", "😎", "🤩", "🥶", "🤬", "🤢"]
        case .sportGames:
            return ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🎱"]
        case .animals:
            return ["🐶", "🐹", "🐰", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮"]
        case .cars:
            return ["🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒", "🚜"]
        case .food:
            return ["🥐", "🥩", "🌭", "🍔", "🍟", "🍕", "🥪", "🍣", "🍳"]
        default:
            return ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "💔", "💖"]
        }
    }
    
    static func random() -> Emoji {
        var rng = SystemRandomNumberGenerator()
        return Emoji.random(using: &rng)
    }
    
    static func random <T: RandomNumberGenerator> (using generator: inout T) -> Emoji {
        return allCases.randomElement(using: &generator)!
    }
}
