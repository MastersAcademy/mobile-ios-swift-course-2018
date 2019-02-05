//
//  ApiHandler.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation


class ApiHelper {
    static let apiUsersURL = "https://api.github.com/users/"
    
    class func searchUser(by username: String, manager: ApiManager = .shared, completion: @escaping (Result<UserProfile>) -> Void) {
        let url = apiUsersURL + username
        
        manager.dataRequest(with: url, objectType: UserProfile.self, completion: completion)
     
    }
}
