//
//  ViewController.swift
//  RememberMe
//
//  Created by Myhovych on 25/11/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet var flipCountLabel: UITextField!
   
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    var emojiChoises = ["👽", "👻", "⛄️", "👽", "👻", "⛄️"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipsCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoises[cardNumber], on: sender)
        } else {
            print("Selected card is unknown")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColorFromHex(rgbValue: 0x00BFFF)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColorFromHex(rgbValue: 0xFFC0CB)
        }
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

