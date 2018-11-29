//
//  ViewController.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/19/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreCounterLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: property
    var observers = [NSKeyValueObservation]()
    lazy var game = Remember(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var emojiChoices = ["🍇", "🍉", "🍍", "🍋", "🥐", "🥕", "🥥", "🥗", "🍞"]
    var emoji = [Int: String]()
    
    // mARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObserves()
    }
    
    // MARK: setup UI items
    func setupObserves() {
        self.observers = [
            game.observe(\.flips, options: [.initial, .new]) { [weak self] (game, change) in
                self?.flipCountLabel.text = "Flips: \(game.flips)"
            },
            game.observe(\.score, options: [.initial, .new]) { [weak self] (game, change) in
                self?.scoreCounterLabel.text = "Score: \(game.score)"
            }
        ]
    }
    
    // MARK: IBAction
    @IBAction func touchCard(_ sender: UIButton) {
        game.flips += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            flipAnimation(card: game.cards[cardNumber], on: sender) { [weak self] finished in
                if finished {
                    self?.updateViewFromModel()
                }
            }
        } else {
            print("Selected card is unknown")
        }
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        game.restart()
        updateViewFromModel()
    }
    
    // MARK: update UI
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    private func flipAnimation(card: Card, on button: UIButton, comletion: ((Bool)->Void)? = nil) {
        
        func updateCard() {
            let title = card.isFaceUp ? emoji(for: card) : ""
            let color: UIColor = card.isFaceUp ? .white : .orange
            button.setTitle(title, for: .normal)
            button.backgroundColor = color
        }
        
        UIView.transition(with: button,
                          duration: 0.2,
                          options: .transitionFlipFromLeft,
                          animations: updateCard,
                          completion: comletion)
    }
    
    // MARK: content card
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
