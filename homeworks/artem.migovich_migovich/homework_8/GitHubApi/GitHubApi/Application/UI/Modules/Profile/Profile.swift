//
//  Profile.swift
//  GitHubApi
//
//  Created by Myhovych on 1/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct Profile: Decodable {
    var profilePicture: URL
    var fullName: String?
    var publicRepositories: Int?
    var followers: Int?
    
    enum CodingKeys: String, CodingKey {
        case profilePicture = "avatar_url"
        case fullName = "name"
        case publicRepositories = "public_repos"
        case followers = "followers"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.profilePicture = try container.decode(URL.self, forKey: .profilePicture)
        self.fullName = try? container.decode(String.self, forKey: .fullName)
        self.publicRepositories = try? container.decode(Int.self, forKey: .publicRepositories)
        self.followers = try? container.decode(Int.self, forKey: .followers)
    }
}
