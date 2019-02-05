//
//  ApiError.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation


enum ApiError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
}


extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .networkError(let error):
            return error.localizedDescription
        case .dataNotFound:
            return "Not found data by request"
        case .jsonParsingError(let error):
            return error.localizedDescription
        }
    }
}
