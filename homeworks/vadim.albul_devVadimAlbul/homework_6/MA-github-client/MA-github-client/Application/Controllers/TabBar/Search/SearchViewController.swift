//
//  SearchViewController.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import UIKit

class SearchViewController: BasicViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var contentStackView: UIStackView!
    
    // MARK: property
    fileprivate var searchController: UISearchController!
    var repositoryList: [ReposytoryPresentation] = []
    fileprivate var searchList: [ReposytoryPresentation] = []
    
    var searchBarIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIContent()
    }

    // MARK: setup UI
    func setupUIContent() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        self.repositoryList = ReposytoryPresentation.defaults
        displayList(repositoryList)
    }
    
    // MARK: update UI
    func updateList() {
        let items = searchBarIsEmpty ? self.repositoryList : self.searchList
        displayList(items)
    }
    
    func displayList(_ items: [ReposytoryPresentation]) {
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        items.forEach { (repository) in
            let repoView = RepositoryView()
            repoView.setContent(repo: repository)
            repoView.delegate = self
            contentStackView.addArrangedSubview(repoView)
        }
        self.view.layoutIfNeeded()
    }
    
}

// MARK: - extension: UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        searchList = repositoryList.filter({ (repo) -> Bool in
            return repo.name.lowercased().contains(searchText.lowercased())
        })
        updateList()
    }
}

// MARK: - extension: RepositoryViewDelegate
extension SearchViewController: RepositoryViewDelegate {
    
    func selectReposiory(with identifier: String, in view: RepositoryView) {
        guard let repo = repositoryList.first(where: {$0.identifier == identifier}) else { return }
        let detailVC = DetailRepositoryViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.presentation = repo
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
