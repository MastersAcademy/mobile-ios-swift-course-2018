//
//  UIImageView+Extension.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import Foundation
import UIKit.UIImageView

extension UIImageView {
    
    func loadImage(by url: URL?, with placeholder: UIImage?) -> URLSessionDataTask? {
        image = placeholder
        guard let url = url else { return nil }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data,
                let image = UIImage(data: data)
                else {
                    return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
        return task
    }
}
