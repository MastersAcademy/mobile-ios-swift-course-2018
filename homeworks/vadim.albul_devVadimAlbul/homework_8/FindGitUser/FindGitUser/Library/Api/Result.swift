//
//  Result.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation


enum Result<T> {
    case success(T)
    case failure(Error)
}


extension Result {
    
    func getValue() throws -> T {
        switch self {
        case .success(let value): return value
        case .failure(let error): throw error
        }
    }
}
