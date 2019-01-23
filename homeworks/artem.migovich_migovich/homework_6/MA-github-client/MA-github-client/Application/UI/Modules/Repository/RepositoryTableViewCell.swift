//
//  RepositoryTableViewCell.swift
//  MA-github-client
//
//  Created by Myhovych on 1/23/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

enum Identifier {
    static let RepositoryTableViewCell = "RepositoryTableViewCell"
}

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!

}
