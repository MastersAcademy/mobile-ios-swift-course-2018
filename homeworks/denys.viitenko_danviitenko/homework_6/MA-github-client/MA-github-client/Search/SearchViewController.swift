//
//  SearchViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    var presentationItems = [RepoPresentation]()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var dataFiltered = [RepoPresentation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addRepo()
        let nib = UINib(nibName: NibName.RepoTableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NibName.RepoTableViewCell)
        searchBar.delegate = self
        dataFiltered = presentationItems
        tableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFiltered.count
    }
    func addRepo(){
        let diskRepoPresentation = RepoPresentation(title: "Disk", subtitle:"Forked from saoudrizwan/Disk", description:"Delightful framework for iOS to easily persist structs, images, and data", language: "Swift")
        let rxSwiftRepoPresentation = RepoPresentation(title: "RxSwift", subtitle:"Forked from ReactiveX/RxSwift", description:"Reactive Programming in Swift", language: "Swift")
        let mvpRepoPresentation = RepoPresentation(title: "ios-mvp-clean-architecture", subtitle:"Forked from FortechRomania/ios-mvp-clean-architecture", description:"Demo iOS application built to highlight MVP (Model View Presenter) and Clean Architecture concepts", language: "Swift")
        
        presentationItems += [diskRepoPresentation,rxSwiftRepoPresentation,mvpRepoPresentation]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.RepoTableViewCell, for: indexPath) as! RepoTableViewCell
        let hedline = dataFiltered[indexPath.row]
        cell.titleLabel.text = hedline.title
        cell.subtitleLabel.text = hedline.subtitle
        cell.descriptionLabel.text = hedline.description
        cell.languageLabel.text = hedline.language
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataFiltered = searchText.isEmpty ? presentationItems : presentationItems.filter({(dataString: RepoPresentation) -> Bool in
            dataString.title.range(of: searchText, options: .caseInsensitive) != nil
        } )
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.Identifier.showRepoSearch, sender: nil)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.Identifier.showRepoSearch, let indexPath = tableView.indexPathForSelectedRow, let detailViewController = segue.destination as? DetailSearchViewController, presentationItems.indices.contains(indexPath.row){
            detailViewController.repo = presentationItems[indexPath.row]
            }
        }
}
