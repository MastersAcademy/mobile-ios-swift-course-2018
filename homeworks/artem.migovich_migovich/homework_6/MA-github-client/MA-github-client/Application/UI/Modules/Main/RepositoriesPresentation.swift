//
//  RepositoriesPresentation.swift
//  MA-github-client
//
//  Created by Myhovych on 12/16/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

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
