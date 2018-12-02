//
//  ViewController.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/19/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    // MARK: - Variables
    private lazy var numberOfPairsOfCards = (cardButtons.count + 1) / 2
    private lazy var game = Remember(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private let themes: [Theme] = [Theme(name: "Sport",
                                         emojies: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🎱", "🏓", "🏸"],
                                         color: .white,
                                         shirtColor: .orange),
                                   Theme(name: "Animals",
                                         emojies: ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🦁", "🐷"],
                                         color: .white,
                                         shirtColor: .green),
                                   Theme(name: "Faces",
                                         emojies: ["😀", "😂", "😍", "🤬", "😱", "🤯", "😎", "🤢", "🤠"],
                                         color: .white,
                                         shirtColor: .blue),
                                   Theme(name: "Food",
                                         emojies: ["🍏", "🍉", "🍍", "🍋", "🥐", "🥕", "🥥", "🥗", "🍞"],
                                         color: .white,
                                         shirtColor: .brown),
                                   Theme(name: "Drinks",
                                         emojies: ["🥛", "🍺", "🥃", "🥤", "☕️", "🍸", "🍹", "🍼", "🍵"],
                                         color: .white,
                                         shirtColor: .yellow),
                                   Theme(name: "Cars",
                                         emojies: ["🚗", "🚙", "🚌", "🚎", "🚑", "🚒", "🚛", "🚜", "🏎"],
                                         color: .white,
                                         shirtColor: .gray)]
    
    private lazy var theme = themes.randomElement()!
    
    private var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    private var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    
    // MARK: - Buttons actions
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Selected card is unknown")
        }
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        game = Remember(numberOfPairsOfCards: numberOfPairsOfCards)
        theme = themes.randomElement()!
        updateViewFromModel()
    }
    
    // MARK: - Game methods
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = theme.color
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : theme.shirtColor
            }
        }
        flipsCount = game.flips
        score = game.score
    }
    
    private func emoji(for card: Card) -> String {
        return theme.emoji[card.identifier] ?? "?"
    }
}
