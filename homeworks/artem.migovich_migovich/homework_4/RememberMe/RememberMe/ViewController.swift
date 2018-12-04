//
//  ViewController.swift
//  RememberMe
//
//  Created by Myhovych on 25/11/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

class ViewController: UIViewController {

    lazy var game = Remember(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet var newGame: UIButton!
    @IBOutlet var flipCountLabel: UITextField!
    @IBOutlet var scoreLabel: UITextField!
   
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    
    var theme = Theme.init(emoji: Emoji.getEmoji(name: Int.random(in: 1..<Emoji.allCases.count)), backgroundColor: .random, cardColor: .random)
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Selected card is unknown")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = theme.backgroundColor
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : theme.cardColor
            }
        }
        score = game.score
        flipsCount = game.flips
    }
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return theme.emoji[card.identifier]
    }
    
    var emojiChoices = Emoji.getEmoji(name: Int.random(in: 1..<Emoji.allCases.count))
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game.newGame()
        emoji.removeAll()
        theme = Theme.init(emoji: Emoji.getEmoji(name: Int.random(in: 1..<Emoji.allCases.count)), backgroundColor: .random, cardColor: .random)
        emojiChoices = theme.emoji
        updateViewFromModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
