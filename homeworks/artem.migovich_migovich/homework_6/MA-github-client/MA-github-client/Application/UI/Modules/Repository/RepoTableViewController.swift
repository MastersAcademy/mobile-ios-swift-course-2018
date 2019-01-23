//
//  RepositoriesViewController.swift
//  MA-github-client
//
//    
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController {
    
    var repoPresentation = [RepoPresentation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repositories"
        
        let identifier = UINib.init(nibName: Identifier.RepoTableViewCell, bundle: nil)
        tableView.register(identifier, forCellReuseIdentifier: Identifier.RepoTableViewCell)
        tableView.tableFooterView = UIView()
        
        addRepository()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func addRepository() {
        let mobileIosSwiftCourseRepo = RepoPresentation(title: "mobile-ios-swift-course-2018", subtitle: "Forked from MastersAcademy/mobile-ios-swift-course-2018", description: "Репозиторій з курсів Mobile iOS (Swift) проекту Masters Academy", language: "Swift")
        let findMyBroRepo = RepoPresentation(title: "FindMyBro", subtitle: "", description: "No description, website, or topics provided.", language: "Objective-C")
        
        repoPresentation += [mobileIosSwiftCourseRepo, findMyBroRepo]
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoPresentation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.RepoTableViewCell, for: indexPath) as! RepoTableViewCell
        let repo = repoPresentation[indexPath.row]
        
        
        cell.titleLabel.text = repo.title
        cell.subtitleLabel.text = repo.subtitle
        cell.descriptionLabel.text = repo.description
        cell.languageLabel.text = repo.language
        
        return cell
        
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = repoPresentation[indexPath.row]
        print(number)
    }
    
}
