//
//  RepoTableViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController {
    var presentationItems = [RepoPresentation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        addRepo()
        let nib = UINib.init(nibName: NibName.RepoTableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NibName.RepoTableViewCell)
        tableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentationItems.count
    }
    
    func addRepo(){
        let diskRepoPresentation = RepoPresentation(title: "Disk", subtitle:"Forked from saoudrizwan/Disk", description:"Delightful framework for iOS to easily persist structs, images, and data", language: "Swift")
        let rxSwiftRepoPresentation = RepoPresentation(title: "RxSwift", subtitle:"Forked from ReactiveX/RxSwift", description:"Reactive Programming in Swift", language: "Swift")
        let mvpRepoPresentation = RepoPresentation(title: "ios-mvp-clean-architecture", subtitle:"Forked from FortechRomania/ios-mvp-clean-architecture", description:"Demo iOS application built to highlight MVP (Model View Presenter) and Clean Architecture concepts", language: "Swift")
        
        presentationItems += [diskRepoPresentation,rxSwiftRepoPresentation,mvpRepoPresentation]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.RepoTableViewCell, for: indexPath) as! RepoTableViewCell
        let hedline = presentationItems[indexPath.row]
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
        performSegue(withIdentifier: Segues.Identifier.showDetails, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.Identifier.showDetails, let indexPath = tableView.indexPathForSelectedRow, let detailViewController = segue.destination as? DetailRepoViewController, presentationItems.indices.contains(indexPath.row){
            detailViewController.repo = presentationItems[indexPath.row]
            
        }
    }
}
