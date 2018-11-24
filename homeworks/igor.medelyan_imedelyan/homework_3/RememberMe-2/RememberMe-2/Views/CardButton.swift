//
//  CardButton.swift
//  RememberMe-1
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

class CardButton: UIButton {

    let card: Card
    
    required init(card: Card, frame: CGRect) {
        self.card = card
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViewWithAnimation() {
        UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight  , animations: {
            if self.card.isUpBySuit {
                self.setTitle(self.card.emoji, for: .normal)
                self.backgroundColor = .white
            } else {
                self.setTitle("", for: .normal)
                self.backgroundColor = .orange
            }
        })
    }
}
