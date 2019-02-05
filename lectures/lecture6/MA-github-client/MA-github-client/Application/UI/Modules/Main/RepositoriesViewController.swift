//
//  RepositoriesViewController.swift
//  MA-github-client
//
//  Created by Maksym Savisko on 12/12/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit.UIViewController

class RepositoriesViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
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
            let firstRepo = item.items[0]
            titleLabel.attributedText = firstRepo.name
            subtitleLabel.attributedText = firstRepo.subtitle
            descriptionLabel.attributedText = firstRepo.description
            languageLabel.attributedText = firstRepo.language
        }
    }
}
