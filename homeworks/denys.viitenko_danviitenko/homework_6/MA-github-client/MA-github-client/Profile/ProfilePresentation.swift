//
//  ProfilePresentation.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import Foundation

struct ProfilePresentation {
    let imageName: String?
    let nick: String
    let name: String
    let surname: String
    let mail: String
    let country: String
}

extension ProfilePresentation {
    static func makeMock() -> ProfilePresentation{
        let imageName: String? = nil
        let nick = "DanViitenko"
        let name = "Denys"
        let surname = "Viitenko"
        let mail = "new@gmail.com"
        let country = "Ukraine"
        return ProfilePresentation(imageName: imageName, nick: nick, name: name, surname: surname, mail: mail, country: country)
    }
}
