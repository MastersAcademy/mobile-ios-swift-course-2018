//
//  Repos.swift
//  GitHubApi
//
//  Created by Myhovych on 1/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct  Repositories: Decodable {
    enum CodingKeys: String, CodingKey {
        case repos
    }
    let repos: [Repository]
}

struct Repository: Decodable {
    var name: String?
    var starsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case starsCount = "stargazers_count"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container.decode(String.self, forKey: .name)
        self.starsCount = try? container.decode(Int.self, forKey: .starsCount)
    }
}
