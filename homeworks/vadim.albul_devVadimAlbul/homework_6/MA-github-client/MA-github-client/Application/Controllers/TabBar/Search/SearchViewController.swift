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
    private var searchController: UISearchController!
    private var repositoryList: [ReposytoryPresentation] = []
    private var searchList: [ReposytoryPresentation] = []
    private var searchBarIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    // MARK: life-cycle
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
        
        repositoryList = ReposytoryPresentation.defaults
        render(repositoryList)
    }
    
    // MARK: update UI
    func updateList() {
        let items = searchBarIsEmpty ? repositoryList : searchList
        render(items)
    }
    
    func render(_ items: [ReposytoryPresentation]) {
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        items.forEach { (repository) in
            let repoView = RepositoryView()
            repoView.renderContetn(with: repository)
            repoView.delegate = self
            contentStackView.addArrangedSubview(repoView)
        }
        view.layoutIfNeeded()
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
    
    func didSelectRepositoryView(_ view: RepositoryView, with identifier: String) {
        guard let repo = repositoryList.first(where: {$0.identifier == identifier}) else { return }
        let detailVC = DetailRepositoryViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.presentation = repo
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
