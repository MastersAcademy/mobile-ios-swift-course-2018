//
//  RepositoriesPresentation.swift
//  MA-github-client
//
//  Created by Maksym Savisko on 12/12/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import Foundation

class RepositoriesPresentation {
    var items: [RepoPresentation]
    
    init(items: [RepoPresentation]) {
        self.items = items
    }
}

extension RepositoriesPresentation {
    class func makeDefault() -> RepositoriesPresentation {
        return RepositoriesPresentation(items: [.makeDefault()])
    }
}
