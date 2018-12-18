//
//  RepoTableViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController {
    var repositories = [Repo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        addRepo()
        let nib = UINib.init(nibName: "RepoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RepoTableViewCell")
        tableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    func addRepo(){
        let repo1 = Repo(title: "Disk", subtitle:"Forked from saoudrizwan/Disk", description:"Delightful framework for iOS to easily persist structs, images, and data", language: "Swift")
        let repo2 = Repo(title: "RxSwift", subtitle:"Forked from ReactiveX/RxSwift", description:"Reactive Programming in Swift", language: "Swift")
        let repo3 = Repo(title: "ios-mvp-clean-architecture", subtitle:"Forked from FortechRomania/ios-mvp-clean-architecture", description:"Demo iOS application built to highlight MVP (Model View Presenter) and Clean Architecture concepts", language: "Swift")
        
        repositories += [repo1,repo2,repo3]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
        let hedline = repositories[indexPath.row]
        cell.titleLabel.text = hedline.title
        cell.subtitleLabel.text = hedline.subtitle
        cell.descriptionLabel.text = hedline.description
        cell.languageLabel.text = hedline.language

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
            let detailVC = segue.destination as! DetailRepoViewController
                detailVC.repo = [self.repositories[indexPath.row]]
            }
        }
    }
}
