//
//  RepositoriesViewController.swift
//  MA-github-client
//
//    
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    @IBOutlet weak var firstRepoView: UIView!
    
    @IBOutlet weak var button: UIButton!
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

    @IBAction func buttonPress(_ sender: Any) {
        let nextViewController = RepositoryViewController()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.pushViewController(nextViewController,
                                                 animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repositories"
        self.presentation = RepositoriesPresentation.makeDefault()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RepositoriesViewController.tapFunction))
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        print("tap working")
    }
}
