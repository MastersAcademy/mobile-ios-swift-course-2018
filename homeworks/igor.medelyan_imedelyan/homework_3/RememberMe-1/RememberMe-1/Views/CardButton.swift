//
//  CardButton.swift
//  RememberMe-1
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

class CardButton: UIButton {

    func update(with model: Card) {
        switch model.state {
        case .suit:
            setTitle(model.emoji, for: .normal)
            backgroundColor = .white
        case .shirt:
            setTitle("", for: .normal)
            backgroundColor = .orange
        }
    }
}
