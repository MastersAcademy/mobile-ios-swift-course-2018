//
//  Repository.swift
//  MA-github-client
//
//  Created by Igor Medelyan on 12/16/18.
//  Copyright © 2018 IMedelyan. All rights reserved.
//

import Foundation

struct Repository {
    let name: String
    let subtitle: String
    let description: String
    let language: String
}
    
extension Repository {
    static func makeMock() -> Repository {        
        return Repository(name: "Project",
                          subtitle: "Fork from another Project",
                          description: "Some usefull framework for some usefull Project from some usefull scope",
                          language: "Swift")
    }
}

