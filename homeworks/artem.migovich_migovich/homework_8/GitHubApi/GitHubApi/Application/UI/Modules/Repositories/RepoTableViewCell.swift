//
//  RepositoryTableViewCell.swift
//  GitHubApi
//
//  Created by Myhovych on 1/22/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

enum Identifier {
    static let RepoTableViewCell = "RepoTableViewCell"
}

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    
    // set repository for cell update
    func setRepository(repo: Repository) {
        repoNameLabel.text = repo.name
        starsCountLabel.text = "\(repo.starsCount!)"
    }
}
