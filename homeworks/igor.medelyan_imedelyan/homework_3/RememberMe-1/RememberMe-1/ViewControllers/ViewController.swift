//
//  ViewController.swift
//  RememberMe-1
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [CardButton]!
    
    var cards: [Card] = [Card(emoji: "🎃"),
                         Card(emoji: "👻"),
                         Card(emoji: "🤡"),
                         Card(emoji: "😻")]
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchCard(_ sender: CardButton) {
        flipsCount += 1
        if let cardNumber = cardButtons.index(of: sender), cards.indices.contains(cardNumber) {
            let card = cards[cardNumber]
            card.flip()
            sender.updateWithCard(card)
        } else {
            print("Selected card is unknown")
        }
    }
}

