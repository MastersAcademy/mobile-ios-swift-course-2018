//
//  DetailSearchViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class DetailSearchViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    var repo: RepoPresentation?
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setLabels()
        
    }
    func setLabels(){
        titleLabel.text = repo?.title
        subtitleLabel.text = repo?.subtitle
        descriptionLabel.text = repo?.description
        languageLabel.text = repo?.language
    }
}
