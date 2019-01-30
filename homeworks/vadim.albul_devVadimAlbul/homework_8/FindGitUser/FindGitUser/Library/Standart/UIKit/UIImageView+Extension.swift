//
//  UIImageView+Extension.swift
//  FindGitUser
//
//  Created by Vadim Albul on 1/21/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation
import UIKit

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
