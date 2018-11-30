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
    var cardStyle: StyleCard = ThemeCard.fruits.style
    var emoji = [Int: String]()
    
    // mARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObserves()
        chageCardsStyle()
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
        if let cardNumber = cardButtons.index(of: sender) {
            let cardBeforeChange = game.cards[cardNumber]
            guard !cardBeforeChange.isMatched else { return }
            game.chooseCard(at: cardNumber)
            let card = game.cards[cardNumber]
            if cardBeforeChange.isFaceUp != card.isFaceUp {
                flipAnimation(card: card, on: sender) { [weak self] finished in
                    if finished {
                        self?.updateViewFromModel()
                    }
                }
            } else {
                self.updateViewFromModel()
            }
        } else {
            print("Selected card is unknown")
        }
    }
    
    @IBAction func touchNewGame(_ sender: Any) {
        restartGame()
    }
    
    // MARK: update UI
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            update(card: card, on: button)
        }
        if game.isGameEnded {
            showGameEndedPopup()
        }
    }
    
    private func update(card: Card, on button: UIButton) {
        let title = card.isFaceUp ? emoji(for: card) : ""
        let color: UIColor = card.isFaceUp ? cardStyle.frontColor : (card.isMatched ? .clear : cardStyle.backColor)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
    }
    
    func restartGame() {
        game.restart()
        chageCardsStyle()
    }
    
    func chageCardsStyle() {
        let randomIndex = Int.random(in: 0..<ThemeCard.allCases.count)
        cardStyle = ThemeCard.allCases[randomIndex].style
        emoji.removeAll()
        updateViewFromModel()
    }
    
    private func flipAnimation(card: Card, on button: UIButton, comletion: ((Bool)->Void)? = nil) {
        if !card.isFaceUp && card.isMatched {
             comletion?(true)
            return
        }

        game.flips += 1
        UIView.transition(with: button,
                          duration: 0.2,
                          options: .transitionFlipFromLeft,
                          animations: {
            self.update(card: card, on: button)
        }, completion: comletion)
    }
    
    // MARK: content card
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, cardStyle.emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<cardStyle.emojiChoices.count)
            emoji[card.identifier] = cardStyle.emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    // MARK: show popup
    private func showGameEndedPopup() {
        let alertController = UIAlertController(title: "The game is over!",
                                                message: "Do you want to start a new game?",
                                                preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(noAction)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.restartGame()
        }
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
