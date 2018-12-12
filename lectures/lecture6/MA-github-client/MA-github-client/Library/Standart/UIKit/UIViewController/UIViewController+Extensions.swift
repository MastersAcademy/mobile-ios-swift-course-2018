//
//  UIViewController+Extensions.swift
//  MA-github-client
//
//  Created by Maksym Savisko on 12/12/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    @inline (__always) func loadViewIfNeeded() {
        if !isViewLoaded { _ = view }
    }
}
