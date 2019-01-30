//
//  RepositoriesViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 1/23/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var repositoriesTableView: UITableView!
    var repoPresentation = [RepoPresentation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repositories"
        
        addRepository()
        
        let identifier = UINib.init(nibName: Identifier.RepositoryTableViewCell, bundle: nil)
        self.repositoriesTableView.register(identifier, forCellReuseIdentifier: Identifier.RepositoryTableViewCell)
        
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func addRepository() {
        let mobileIosSwiftCourseRepo = RepoPresentation(title: "mobile-ios-swift-course-2018", subtitle: "Forked from MastersAcademy/mobile-ios-swift-course-2018", description: "Репозиторій з курсів Mobile iOS (Swift) проекту Masters Academy", language: "Swift")
        let findMyBroRepo = RepoPresentation(title: "FindMyBro", subtitle: "No subtitle", description: "No description, website, or topics provided.", language: "Objective-C")
        let gitHubViewer = RepoPresentation(title: "GitHubViewer", subtitle: "Forked from MastersAcademy", description: "App for view git hub", language: "Swift")
        
        repoPresentation += [mobileIosSwiftCourseRepo, findMyBroRepo, gitHubViewer]
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoPresentation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.RepositoryTableViewCell, for: indexPath) as! RepositoryTableViewCell
        let repo = repoPresentation[indexPath.row]
        
        
        cell.titleLabel.text = repo.title
        cell.subtitleLabel.text = repo.subtitle
        cell.descriptionLabel.text = repo.description
        cell.languageLabel.text = repo.language
        
        return cell
        
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = repoPresentation[indexPath.row]
        print(number)
    }

}
