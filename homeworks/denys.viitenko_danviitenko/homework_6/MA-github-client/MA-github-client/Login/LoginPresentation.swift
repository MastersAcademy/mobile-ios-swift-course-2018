//
//  LoginPresentation.swift
//  MA-github-client
//
//  Created by Dan on 12/18/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import Foundation

struct LoginPresentation  {
    var email: String
    var password: String
}

extension LoginPresentation{
    static func makeMock() -> LoginPresentation {
        let email = "admin"
        let password = "admin"
        return LoginPresentation(email: email, password: password)
    }
}
