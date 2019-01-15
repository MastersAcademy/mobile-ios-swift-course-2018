//
//  UIViewController+Extensions.swift
//  MA-github-client
//
//  Created by Myhovych on 12/16/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    @inline (__always) func loadViewIfNeeded() {
        if !isViewLoaded { _ = view }
    }
}
