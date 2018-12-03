//
//  ViewController.swift
//  homework_3_subtask_2
//
//  Created by Andrew Shevtsov on 11/28/18.
//  Copyright © 2018 Andrew Shevtsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emojiArray = ["😉", "🙃", "😎", "😛"]
    
    // UI elements
    
    let flipsNumberLabel: UILabel = UILabel()
    
    var butttons: [UIButton] = [
        UIButton(frame: CGRect(x: 60, y: 80, width: 100, height: 150)),
        UIButton(frame: CGRect(x: 210, y: 80, width: 100, height: 150)),
        UIButton(frame: CGRect(x: 60, y: 270, width: 100, height: 150)),
        UIButton(frame: CGRect(x: 210, y: 270, width: 100, height: 150))]
    
    var numberOfFlips = 0 {
        didSet {
            flipsNumberLabel.text = "Flips: \(numberOfFlips)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        addLabel()
    }
    
    func addLabel(){
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        let padding: CGFloat = 20
        let labelHeight: CGFloat = 100
        
        flipsNumberLabel.frame = CGRect(x: padding, y: screenHeight - padding - labelHeight, width: screenWidth - padding * 2, height: labelHeight)
        flipsNumberLabel.backgroundColor = UIColor.lightGray
        flipsNumberLabel.textAlignment = .center
        flipsNumberLabel.text = "Flips"
        flipsNumberLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.view.addSubview(flipsNumberLabel)
    }
    func addButtons(){
        for button in butttons {
            button.backgroundColor = UIColor.lightGray
            button.titleLabel?.text = ""
            button.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
            
            self.view.addSubview(button)
        }
    }
    
    @objc func touchCard(_ sender: UIButton){
        numberOfFlips += 1
        if let cardNumber = butttons.index(of: sender),
            emojiArray.indices.contains(cardNumber){
            flipCard(withEmoji: emojiArray[cardNumber], on: sender)
        } else {
            print("Selected card is unknown")
        }
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .lightGray
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}

