//
//  DetailRepoViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class DetailRepoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    var repo = [Repo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setLabels()
        
    }
    func setLabels(){
        titleLabel.text = repo[0].title
        subtitleLabel.text = repo[0].subtitle
        descriptionLabel.text = repo[0].description
        languageLabel.text = repo[0].language
    }
}
