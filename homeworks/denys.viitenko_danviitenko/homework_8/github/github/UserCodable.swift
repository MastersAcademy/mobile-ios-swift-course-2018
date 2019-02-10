//
//  UserCodable.swift
//  github
//
//  Created by Dan on 1/20/19.
//  Copyright © 2019 Dan Viitenko. All rights reserved.
//

import Foundation

struct UserRepo: Codable {
    let login: String
    let avatar_url: String
    let name: String
    let public_repos: Int
    let followers: Int
}
