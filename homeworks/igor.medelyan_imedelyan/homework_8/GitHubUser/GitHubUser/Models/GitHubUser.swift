//
//  GitHubUser.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import Foundation

struct GitHubUser: Decodable {
    let id: Int
    let login: String
    let name: String
    let avatar_url: String
    let followers: Int
    let public_repos: Int
}
