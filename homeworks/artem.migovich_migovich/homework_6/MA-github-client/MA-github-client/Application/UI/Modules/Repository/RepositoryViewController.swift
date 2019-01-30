//
//  RepositoryViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 12/17/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    var repo: RepoPresentation?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repository"
  //      setLabels()
        //tabBarController?.tabBar.isHidden = true
    }
    
//    func setLabels() {
//        titleLabel.text = repo?.title ?? "Tittle"
//        subtitleLabel.text = repo?.subtitle ?? "Subtitle"
//        descriptionLabel.text = repo?.description ?? "Desctiption"
//        languageLabel.text = repo?.language ?? "Language"
//    }
}
