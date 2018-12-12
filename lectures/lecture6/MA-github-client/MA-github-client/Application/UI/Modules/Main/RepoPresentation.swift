//
//  RepoPresentation.swift
//  MA-github-client
//
//  Created by Maksym Savisko on 12/12/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import Foundation.NSAttributedString
import UIKit.UIFont

struct RepoPresentation {
    let name: NSAttributedString
    let subtitle: NSAttributedString
    let description: NSAttributedString
    let language: NSAttributedString
}

extension RepoPresentation {
    static func makeDefault() -> RepoPresentation {
        let nameFont = defaultFont(for: .title1)
        let name = NSAttributedString(string: "Disk",
                                      attributes: [.font: nameFont,
                                                   .foregroundColor: UIColor.blue])
        
        let subtitleFont = defaultFont(for: .subheadline)
        let subtitle = NSAttributedString(string: "Forked from saoudrizwan/Disk",
                                          attributes: [.font: subtitleFont,
                                                       .foregroundColor: UIColor.gray])
        
        let descriptionFont = UIFont.preferredFont(forTextStyle: .body)
        let description = NSAttributedString.init(string: "Delightful framework for iOS to easily persist structs, images, and data",
                                                  attributes: [.font: descriptionFont,
                                                               .foregroundColor: UIColor.gray])
        
        let languageFont = UIFont.preferredFont(forTextStyle: .body)
        let language = NSAttributedString(string: "Swift ",
                                          attributes: [.font: languageFont,
                                                       .foregroundColor: UIColor.orange])
        
        return RepoPresentation(name: name,
                                subtitle: subtitle,
                                description: description,
                                language: language)
    }
    
    private static func defaultFont(for style: UIFont.TextStyle) -> UIFont {
        return UIFont.preferredFont(forTextStyle: style)
    }
    
    
}
