//
//  UIViewController+Extension.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation
import UIKit.UIViewController

extension UIViewController {
    
    @inline (__always) func loadViewIfNeeded() {
        if !isViewLoaded { _ = view }
    }
}
