//
//  ViewController.swift
//  RememberMe-2
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCountLabel: UILabel!
    
    var cards: [Card] = [Card(emoji: "🎃"),
                         Card(emoji: "👻"),
                         Card(emoji: "🤡"),
                         Card(emoji: "😻")]
    
    var cardSize: CGSize {
        let cardRows = CGFloat(round(Double(cards.count / 2)))
        let padding: CGFloat = 50.0
        var buttonHeight = (view.bounds.height - 200.0) / cardRows - padding
        buttonHeight = buttonHeight > 120.0 ? 120.0 : buttonHeight
        let buttonWidth = buttonHeight * 2 / 3
        return CGSize(width: buttonWidth, height: buttonHeight)
    }
    
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupButtons()
        setupCountLabel()
    }
    
    // MARK: - UI setup
    func setupButtons() {
        for (index, card) in cards.enumerated() {
            let frame = CGRect(origin: pointForCard(at: index), size: cardSize)
            let button = CardButton(card: card, frame: frame)
            button.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    func setupCountLabel() {
        flipCountLabel = UILabel()
        flipCountLabel.textAlignment = .center
        flipCountLabel.backgroundColor = .orange
        view.addSubview(flipCountLabel)

        // set position of label
        flipCountLabel.translatesAutoresizingMaskIntoConstraints = false
        flipCountLabel.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        flipCountLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        flipCountLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        flipCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // MARK: - Button actions
    @objc func touchCard(_ sender: CardButton) {
        flipsCount += 1
        sender.card.flip()
        sender.updateViewWithAnimation()
    }
    
    // MARK: - Helper methods
    func pointForCard(at index: Int) -> CGPoint {
        let row = CGFloat(floor(Double(index / 2)))
        let xPoint = index % 2 == 0 ? view.bounds.width / 2 - cardSize.width - 25.0 : view.bounds.width / 2 + 25.0
        return CGPoint(x: xPoint, y: 50.0 + (cardSize.height + 50.0) * row)
    }
}
