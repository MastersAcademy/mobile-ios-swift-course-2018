//
//  Theme.swift
//  RememberMe
//
//  Created by Igor Medelyan on 12/2/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit

struct Theme {
    
    let name: String
    var emoji: [Int: String]
    let color: UIColor
    let shirtColor: UIColor
    
    init(name: String, emojies: [String], color: UIColor, shirtColor: UIColor) {
        self.name = name
        self.color = color
        self.shirtColor = shirtColor
        self.emoji = [Int: String]()
        for i in 0...emojies.count - 1 {
            self.emoji[i] = emojies[i]
        }
    }
}
