//
//  ProfilePresentation.swift
//  MA-github-client
//
//  Created by Myhovych on 12/23/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation
import Foundation.NSAttributedString
import UIKit.UIFont

struct ProfilePresentation {
    let imageName: String
    let name: NSAttributedString
    let nickname: NSAttributedString
    let bio: String
    let company: String
    let country: String
    let email: NSAttributedString 
    let website: NSAttributedString
}

extension ProfilePresentation {
    static func makeMock() -> ProfilePresentation{
        let imageName = "profile_picture"
        let nameFont = defaultFont(for: .title1)
        let name = NSAttributedString(string: "Artem Migovich",
                                      attributes: [.font: nameFont,
                                                   .foregroundColor: UIColor.black])
        let nicknameFont = defaultFont(for: .title2)
        let nickname = NSAttributedString(string: "Migovich",
                                      attributes: [.font: nicknameFont,
                                                   .foregroundColor: UIColor.darkGray])
        let bio = "iOS"
        let company = "Master of Code Global"
        let country = "Ukraine"
        let emailFont = defaultFont(for: .body)
        let email = NSAttributedString(string: "migovichdev@gmail.com",
                                          attributes: [.font: emailFont,
                                                       .foregroundColor: UIColor.blue])
        let websiteFont = defaultFont(for: .body)
        let website = NSAttributedString(string: "vk.com/migovich",
                                          attributes: [.font: websiteFont,
                                                       .foregroundColor: UIColor.blue])

        return ProfilePresentation(imageName: imageName, name: name, nickname: nickname, bio: bio, company: company, country: country, email: email, website: website)
    }
    
    private static func defaultFont(for style: UIFont.TextStyle) -> UIFont {
        return UIFont.preferredFont(forTextStyle: style)
    }
}
