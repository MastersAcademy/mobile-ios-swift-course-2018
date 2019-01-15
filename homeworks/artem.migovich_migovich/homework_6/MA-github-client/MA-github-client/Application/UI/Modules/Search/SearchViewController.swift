//
//  SearchViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 12/17/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        self.title = "Search"
    }
}
