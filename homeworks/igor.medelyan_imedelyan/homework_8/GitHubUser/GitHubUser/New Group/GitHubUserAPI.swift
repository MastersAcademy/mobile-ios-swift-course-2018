//
//  GitHubUserAPI.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import Moya

enum GitHubUserAPI {
    case getUserInfo(username: String)
    case getRepositories(username: String)
}

extension GitHubUserAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com/users/") else {
            fatalError("BASE_URL is invalid")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getUserInfo(let username):
            return "\(username)"
        case .getRepositories(let username):
            return "\(username)/repos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return nil
    }
}
