//
//  RepoPresentation.swift
//  MA-github-client
//
//  Created by Myhovych on 12/16/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation
import UIKit

struct RepoPresentation {
    let title: String
    let subtitle: String
    let description: String
    let language: String
}
//
//extension RepoPresentation {
//    static func makeDefault() -> RepoPresentation {
//        let nameFont = defaultFont(for: .title1)
//        let name = NSAttributedString(string: "mobile-ios-swift-course-2018",
//                                      attributes: [.font: nameFont,
//                                                   .foregroundColor: UIColor.blue])
//
//        let subtitleFont = defaultFont(for: .subheadline)
//        let subtitle = NSAttributedString(string: "Forked from MastersAcademy/mobile-ios-swift-course-2018",
//                                          attributes: [.font: subtitleFont,
//                                                       .foregroundColor: UIColor.gray])
//
//        let descriptionFont = defaultFont(for: .body)
//        let description = NSAttributedString.init(string: "Репозиторій з курсів \"Mobile iOS (Swift)\" проекту Masters Academy",
//                                                  attributes: [.font: descriptionFont,
//                                                               .foregroundColor: UIColor.gray])
//
//        let languageFont = defaultFont(for: .body)
//        let language = NSAttributedString(string: "Swift ",
//                                          attributes: [.font: languageFont,
//                                                       .foregroundColor: UIColor.orange])
//
//        return RepoPresentation(name: name,
//                                subtitle: subtitle,
//                                description: description,
//                                language: language)
//    }
//
//    private static func defaultFont(for style: UIFont.TextStyle) -> UIFont {
//        return UIFont.preferredFont(forTextStyle: style)
//    }
//}
