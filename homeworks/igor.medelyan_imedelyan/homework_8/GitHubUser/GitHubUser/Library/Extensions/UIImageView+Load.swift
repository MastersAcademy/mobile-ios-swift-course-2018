//
//  UIImageView+Load.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/26/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
