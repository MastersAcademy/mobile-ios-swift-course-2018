//
//  RepositoriesTableViewController.swift
//  MA-github-client
//
//  Created by Igor Medelyan on 12/16/18.
//  Copyright © 2018 IMedelyan. All rights reserved.
//

import UIKit

class RepositoriesTableViewController: UITableViewController {

    // MARK: - Variables
    let repositories: [Repository] = [Repository.createMockObject(),
                                      Repository.createMockObject(),
                                      Repository.createMockObject()]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.register(RepositoryTableViewCell.nib, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        let detailVC = segue.destination as! RepositoryDetailedViewController
        detailVC.repository = repositories[selectedRow]
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as! RepositoryTableViewCell
        cell.fill(with: repositories[indexPath.row])
        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RepositiryDetailedSegue", sender: self)
    }
}
