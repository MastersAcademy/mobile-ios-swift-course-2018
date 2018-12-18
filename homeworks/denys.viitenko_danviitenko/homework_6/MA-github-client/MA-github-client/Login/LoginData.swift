//
//  LoginData.swift
//  MA-github-client
//
//  Created by Dan on 12/18/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import Foundation

struct LoginData  {
    var email: String
    var password: String
}

extension LoginData{
    static func lock() -> LoginData {
        let email = "admin"
        let password = "admin"
        return LoginData(email: email, password: password)
    }
    
}
