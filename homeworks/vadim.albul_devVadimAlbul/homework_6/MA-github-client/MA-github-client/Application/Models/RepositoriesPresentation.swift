//
//  RepositoriesPresentation.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import Foundation

class RepositoriesPresentation: BasicPresentation {
    var items: [ReposytoryPresentation]
    
    init(items: [ReposytoryPresentation]) {
        self.items = items
    }
}


extension RepositoriesPresentation {
    
    class var `default`: RepositoriesPresentation {
        return RepositoriesPresentation(items: ReposytoryPresentation.defaults)
    }
}
