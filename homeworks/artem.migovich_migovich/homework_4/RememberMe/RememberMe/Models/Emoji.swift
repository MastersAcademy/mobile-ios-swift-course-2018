//
//  Emoji.swift
//  RememberMe
//
//  Created by Myhovych on 02/12/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation

enum Emoji: CaseIterable {
    
    case Fruits
    case Faces
    case SportGames
    case Animals
    case Cars
    case Food
        
    static func getEmoji(name: Int) -> [String] {
        switch name {
        case 1:
            return ["🍏", "🍊", "🍋", "🍌", "🍓", "🍒", "🥥", "🍍", "🥝"]
        case 2:
            return ["😁", "🤪", "🥰", "🤓", "😎", "🤩", "🥶", "🤬", "🤢"]
        case 3:
            return ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🎱"]
        case 4:
            return ["🐶", "🐹", "🐰", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮"]
        case 5:
            return ["🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒", "🚜"]
        case 6:
            return ["🥐", "🥩", "🌭", "🍔", "🍟", "🍕", "🥪", "🍣", "🍳"]
        default:
            return ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "💔", "💖"]
        }
    }
}
