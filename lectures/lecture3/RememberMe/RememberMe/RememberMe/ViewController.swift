//
//  ViewController.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/19/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipsCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber],
                     on: sender)
        } else {
            print("Selected card is unknown")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}
