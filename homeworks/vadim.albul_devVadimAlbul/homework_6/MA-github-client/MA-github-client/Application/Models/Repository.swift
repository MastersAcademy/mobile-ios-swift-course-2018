//
//  Repository.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import Foundation

struct ReposytoryPresentation: BasicPresentation {
    var identifier: String
    var name: String
    var subtitle: String
    var description: String?
    var language: String
}

extension ReposytoryPresentation {
    
    static var `defaults`: [ReposytoryPresentation] {
        return [
            ReposytoryPresentation(identifier: "mobile-ios-swift-course-2018",
                       name: "mobile-ios-swift-course-2018",
                       subtitle: "Forked from MastersAcademy/mobile-ios-swift-course-2018",
                       description: "Репозиторій з курсів \"Mobile iOS (Swift)\" проекту Masters Academy",
                       language: "Swift"),
            ReposytoryPresentation(identifier: "js-course-2018",
                       name: "js-course-2018",
                       subtitle: "Forked from MastersAcademy/mobile-ios-swift-course-2018",
                       description: "Репозиторій з курсів «Front-end» та «NodeJS» проекту Masters Academy",
                       language: "HTML"),
            ReposytoryPresentation(identifier: "ruby-course-2018",
                       name: "ruby-course-2018",
                       subtitle: "Forked from MastersAcademy/mobile-ios-swift-course-2018",
                       description: "Ruby Course 2018-2019",
                       language: "Ruby")
        ]
    }
}
