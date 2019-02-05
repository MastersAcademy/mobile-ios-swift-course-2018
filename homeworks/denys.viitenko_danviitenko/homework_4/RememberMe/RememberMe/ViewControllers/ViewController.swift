//
//  ViewController.swift
//  RememberMe
//
//  Created by Maksym Savisko on 11/19/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Remember(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return cardButtons.count / 2
    }
    
    var themeCardEmoji = [String]()
    var cardColorTheme = UIColor()
    var backgroundColorTheme = UIColor()
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func newGameButton() {
       newGame()
    }
    
    var themes: [CardTheme] = [CardTheme.init(name:"Sport", emoji: ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🏓","🏸","🥅"], backgroundColor: .green, cardColor: .yellow),
                               CardTheme.init(name: "Animals",emoji: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯"], backgroundColor: .yellow, cardColor: .blue), CardTheme.init(name:"Faces",emoji: ["😀","😄","😆","🤣","😂","😇","😜","🤪","😎","😏"], backgroundColor: .blue, cardColor: .orange),
        CardTheme.init(name: "Cars", emoji: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐"], backgroundColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), cardColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)),
        CardTheme.init(name: "Flags", emoji: ["🇺🇦","🇬🇸","🇹🇫","🇹🇴","🇹🇷","🇺🇸","🇳🇿","🇳🇮","🇨🇰","🇱🇷"], backgroundColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), cardColor: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)),CardTheme.init(name: "Food", emoji: ["🍕", "🍉","🍔","🍟","🍫","🌭","🍖","🌯","🍗","🍝"], backgroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), cardColor: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
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
                button.backgroundColor = cardColorTheme
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : backgroundColorTheme
            }
        }
        flipsCount = game.flipsCount
        score = game.score
    }
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, themeCardEmoji.count > 0 {
            let randomIndex = Int.random(in: 0..<themeCardEmoji.count)
            emoji[card.identifier] = themeCardEmoji.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = backgroundColorTheme
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = cardColorTheme
        }
    }
    
    func choiceTheme(){
        let randomTheme = themes.randomElement()!
        themeCardEmoji = randomTheme.emoji
        cardColorTheme = randomTheme.cardColor
        backgroundColorTheme = randomTheme.backgroundColor
        
    }
    func newGame(){
        game.removeCards()
        game = Remember(numberOfPairsOfCards: numberOfPairsOfCards)
        choiceTheme()
        emoji.removeAll()
        updateViewFromModel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceTheme()
        updateViewFromModel()
    }
}
