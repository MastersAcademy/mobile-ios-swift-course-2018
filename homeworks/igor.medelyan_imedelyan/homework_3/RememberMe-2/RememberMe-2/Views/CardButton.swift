//
//  CardButton.swift
//  RememberMe-1
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

class CardButton: UIButton {
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        titleLabel?.font =  .systemFont(ofSize: 22)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: Card, animate animationFlag: Bool = true) {
        if animationFlag {
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight  , animations: {
                if model.isUpBySuit {
                    self.setTitle(model.emoji, for: .normal)
                    self.backgroundColor = .white
                } else {
                    self.setTitle("", for: .normal)
                    self.backgroundColor = .orange
                }
            })
        } else {
            if model.isUpBySuit {
                self.setTitle(model.emoji, for: .normal)
                self.backgroundColor = .white
            } else {
                self.setTitle("", for: .normal)
                self.backgroundColor = .orange
            }
        }
    }
}
