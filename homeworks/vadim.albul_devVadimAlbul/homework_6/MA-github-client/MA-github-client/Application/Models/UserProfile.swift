//
//  UserProfile.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import Foundation
import UIKit

class UserProfile: BasicPresentation {
    var identifier: String
    var name: String
    var nickname: String
    var bio: String?
    var email: String
    var avatarStringURL: String?
    var country: String?
    
    init(identifier: String,
         name: String,
         nickname: String,
         email: String,
         avatarStringURL: String?,
         country: String? = nil,
         bio: String? = nil) {
        
        self.identifier = identifier
        self.name = name
        self.nickname = nickname
        self.bio = bio
        self.email = email
        self.avatarStringURL = avatarStringURL
        self.country = country
    }
    
    var avatarURL: URL? {
        guard let textURL = avatarStringURL else { return nil }
        return URL(string: textURL)
    }
}

extension UserProfile {
    
    static var `default`: UserProfile {
        return UserProfile(identifier: UUID().uuidString,
                           name: "Masters Academy",
                           nickname: "MastersAcademy",
                           email: "m.a@masterofcode.com",
                           avatarStringURL: "https://avatars0.githubusercontent.com/u/22305415?s=200&v=4",
                           country: "Ukrainian",
                           bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}
