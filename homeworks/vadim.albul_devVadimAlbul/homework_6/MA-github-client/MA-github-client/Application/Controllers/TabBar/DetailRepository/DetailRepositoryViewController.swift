//
//  DetailRepositoryViewController.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import UIKit

class DetailRepositoryViewController: BasicViewController {

    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: update UI
    override func updateUIWithPresentation() {
        (presentation as? ReposytoryPresentation).map { (repo) in
            lblTitle.text = repo.name
            lblSubTitle.text = repo.subtitle
            lblLanguage.text = repo.language
            lblDescription.text = repo.description
        }
    }
}
