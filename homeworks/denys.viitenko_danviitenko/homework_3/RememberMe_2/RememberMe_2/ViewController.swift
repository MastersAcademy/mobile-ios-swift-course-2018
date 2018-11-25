//
//  ViewController.swift
//  RememberMe_2
//
//  Created by Dan on 11/25/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let flipCountLabel: UILabel! = UILabel()
    
    var butttons: [UIButton] = [UIButton(frame: CGRect(x: 94, y: 79, width: 90, height: 122)), UIButton(frame: CGRect(x: 229, y: 79, width: 90, height: 122)), UIButton(frame: CGRect(x: 94, y: 240, width: 90, height: 122)), UIButton(frame: CGRect(x: 229, y: 240, width: 90, height: 122))]
    
    var flipsCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipsCount)"
        }
    }
    
    func addLabel(){
        flipCountLabel.frame = CGRect(x: 108, y: 580, width: 199, height: 110)
        flipCountLabel.backgroundColor = UIColor.orange
        flipCountLabel.textAlignment = .center
        flipCountLabel.text = "Flips"
        flipCountLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.view.addSubview(flipCountLabel)
    }
    func addButtons(){
        for a in butttons {
            a.backgroundColor = UIColor.orange
            a.titleLabel?.text = ""
            a.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
            
            self.view.addSubview(a)
            
        }
    }
    
    var emojiChoices = ["🎃","👻","🎃"]
    
    
    @objc func touchCard(_ sender: UIButton){
        flipsCount += 1
        if let cardNumber = butttons.index(of: sender),
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
        addButtons()
        addLabel()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
