//
//  UITextField+NextResponder.swift
//  NextTextField
//
//  Created by Igor Medelyan on 1/2/19.
//  Copyright © 2019 MastersAcademy. All rights reserved.
//

import UIKit

extension UITextField {
    @discardableResult func add<T: UIResponder>(nextResponder: T) -> T {
        addTarget(nextResponder, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        return nextResponder
    }
}
