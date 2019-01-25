//
//  Extensions.swift
//  GitHubApi
//
//  Created by Myhovych on 1/22/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation
import UIKit

//Set image from url
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        DispatchQueue.main.async {
            self.contentMode = mode
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
//Inverse image colors
extension ProfileViewController {
    func invertedImage(imageView: UIImageView) {
        if imageView.image != nil {
            let beginImage = CIImage(image: imageView.image!)
            if let filter = CIFilter(name: "CIColorInvert") {
                filter.setValue(beginImage, forKey: kCIInputImageKey)
                let newImage = UIImage(ciImage: filter.outputImage!)
                imageView.image = newImage
            }
        } else { print("Image couldn't load") }
    }
}
