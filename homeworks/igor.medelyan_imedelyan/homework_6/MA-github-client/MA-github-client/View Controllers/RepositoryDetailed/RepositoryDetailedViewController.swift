//
//  RepositoryDetailedViewController.swift
//  MA-github-client
//
//  Created by Igor Medelyan on 12/16/18.
//  Copyright © 2018 IMedelyan. All rights reserved.
//

import UIKit

class RepositoryDetailedViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subtitileLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    
    // MARK: - Variables
    var repository: Repository?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        let nameFont = UIFont.defaultFont(for: .title1)
        let name = NSAttributedString(string: repository?.name ?? "",
                                      attributes: [.font: nameFont, .foregroundColor: UIColor.blue])
        nameLabel.attributedText = name
        
        let subtitleFont = UIFont.defaultFont(for: .subheadline)
        let subtitle = NSAttributedString(string: repository?.subtitle ?? "",
                                          attributes: [.font: subtitleFont, .foregroundColor: UIColor.gray])
        subtitileLabel.attributedText = subtitle
        
        let descriptionFont = UIFont.defaultFont(for: .body)
        let description = NSAttributedString(string: repository?.description ?? "",
                                             attributes: [.font: descriptionFont, .foregroundColor: UIColor.gray])
        descriptionLabel.attributedText = description
        
        let languageFont = UIFont.defaultFont(for: .body)
        let language = NSAttributedString(string: repository?.language ?? "",
                                          attributes: [.font: languageFont, .foregroundColor: UIColor.gray])
        languageLabel.attributedText = language
    }
}
