//
//  RepositoriesPresentation.swift
//  MA-github-client
//
//  Created by Myhovych on 12/16/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit


enum Identifier {
    static let RepoTableViewCell = "RepoTableViewCell"
}

@IBDesignable
class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
}
