//
//  RepositoryViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 12/17/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController {

    var presentation: RepositoriesPresentation? {
        willSet {
            loadViewIfNeeded()
        }
        didSet {
            updateViewWithPresentation()
        }
    }
    
    func updateViewWithPresentation() {
        presentation.map { item in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repository"
    }
}
