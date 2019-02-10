//
//  RepoTableViewCell.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/26/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var stargazersCountLabel: UILabel!

    func fill(with repository: Repository) {
        repositoryNameLabel.text = repository.name
        stargazersCountLabel.text = String(repository.stargazers_count)
    }
}
