//
//  UIFont+PrefferedStyle.swift
//  MA-github-client
//
//  Created by Igor Medelyan on 12/16/18.
//  Copyright © 2018 IMedelyan. All rights reserved.
//

import UIKit

extension UIFont {
    static func defaultFont(for style: UIFont.TextStyle) -> UIFont {
        return UIFont.preferredFont(forTextStyle: style)
    }
}
