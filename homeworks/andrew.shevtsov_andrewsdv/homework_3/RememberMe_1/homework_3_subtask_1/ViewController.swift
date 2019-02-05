//
//  ViewController.swift
//  homework_3_task_001
//
//  Created by Andrew Shevtsov on 11/25/18.
//  Copyright © 2018 Andrew Shevtsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfFlipsLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var cardEmojis = ["😎", "🙃", "😊", "😉"]
    
    var numberOfFlips = 0 {
        didSet {
            numberOfFlipsLabel.text = "Flips: \(numberOfFlips)"
        }
    }

    @IBAction func tapCard(_ sender: UIButton) {
        numberOfFlips += 1
        if let cardIndex = cardButtons.index(of: sender) {
            flipCard(withEmoji: cardEmojis[cardIndex], onButton: sender)
        } else {
            print("Button not found")
        }
    }
    
    func flipCard(withEmoji emoji: String, onButton button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .brown
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

