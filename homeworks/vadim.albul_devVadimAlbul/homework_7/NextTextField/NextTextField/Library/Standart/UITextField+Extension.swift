//
//  UITextField+Extension.swift
//  NextTextField
//
//  Created by Vadim Albul on 12/27/18.
//  Copyright © 2018 MastersAcademy. All rights reserved.
//

import UIKit.UITextField

private var kAssociationKeyNextField = "kAssociationKeyNextField"

extension UITextField {
    
    @IBOutlet var nextField: UITextField? {
        get {
            return objc_getAssociatedObject(self, &kAssociationKeyNextField) as? UITextField
        }
        set(newField) {
            objc_setAssociatedObject(self, &kAssociationKeyNextField, newField, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
