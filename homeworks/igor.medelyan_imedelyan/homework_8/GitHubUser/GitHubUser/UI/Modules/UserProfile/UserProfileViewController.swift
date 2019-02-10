//
//  UserProfileViewController.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var userAvatarImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var followersCountLabel: UILabel!
    @IBOutlet private weak var reposCountLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Variables
    var user: GitHubUser!
    var repositories: [Repository]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        fullNameLabel.text = user.name
        userNameLabel.text = user.login
        followersCountLabel.text = String(user.followers)
        reposCountLabel.text = String(user.public_repos)
        guard let url = URL(string: user.avatar_url) else { return }
        userAvatarImageView.load(url: url)
    }
}

extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as? RepoTableViewCell else {
            return UITableViewCell()
        }
        cell.fill(with: repositories[indexPath.row])
        return cell
    }
}
