//
//  ViewController.swift
//  RememberMeWithoutStoryboard
//
//  Created by Myhovych on 25/11/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    var card: UIButton!
    var cards = [UIButton]()
    var label: UILabel!
    
    var flipsCount = 0 {
        didSet {
            label.text = "Flips: \(flipsCount)"
        }
    }
    var emojiChoises = ["👽", "👻", "👽", "👻"]
    
    @objc func touchCard(_ sender: UIButton) {
        flipsCount += 1
        if let cardNumber = cards.index(of: sender) {
            flipCard(withEmoji: emojiChoises[cardNumber], on: sender)
        } else {
            print("Selected card is unknown")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .darkGray
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColorFromHex(rgbValue: 0xFFC0CB)
        }
    }
    
    func addCard(_ sender: Any) {
        
        card = UIButton(type: .system)
        card.frame = CGRect(x: 50, y: 0, width: self.view.frame.width / 3, height: 240)
        card.setTitle("", for: .normal)
        card.backgroundColor = .darkGray
        cards.append(card)
        self.view.addSubview(card)
    
        for (index, _) in cards.enumerated() {
            if index % 2 == 0 {
                if card.frame.origin.y > 0 {
                    card.frame.origin.y += 290
                } else {
                    card.frame.origin.y += 130
                }
            } else { if card.frame.origin.x > 180 {
                card.frame.origin.x = 50
            } else {
                card.frame.origin.x += 180
                }
            }
            card.addTarget(self, action: #selector(touchCard(_:)), for: UIControl.Event.touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1)
        
        navigationItem.title = "Remember Me"
        navigationController?.navigationBar.barTintColor = UIColor(red: 217/255, green: 48/255, blue: 80/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:
            UIFont(name: "Helvetica", size: 20.0)!]
        
        label = UILabel()
        label.frame = CGRect(x: 0, y: 700, width: self.view.frame.width, height: 50)
        label.textAlignment = NSTextAlignment.center
        label.text = "Flips: "
        label.textColor = .black
        label.backgroundColor = UIColorFromHex(rgbValue: 0xFFC0CB, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 24)
        self.view.addSubview(label)
        
        for card in emojiChoises {
            addCard(card)
        }
    }
}
