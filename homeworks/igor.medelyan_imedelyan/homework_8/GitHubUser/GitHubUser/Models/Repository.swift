//
//  Repository.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let stargazers_count: Int
}
