//
//  ViewController.swift
//  RememberMe
//
//  Created by Dan on 11/25/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
   
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    
    var emojiChoices = ["🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton){
        flipsCount += 1
        if let cardNumber = cardButtons.index(of: sender),
            emojiChoices.indices.contains(cardNumber){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Selected card is unknown")
        }
    }
  
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

