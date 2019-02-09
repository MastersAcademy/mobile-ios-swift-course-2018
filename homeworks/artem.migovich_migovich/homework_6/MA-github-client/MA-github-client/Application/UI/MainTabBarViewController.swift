//
//  MainTabBarViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 12/20/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let iconSize = CGSize(width: 20, height: 20)
        
        let repositoriesVC = UINavigationController(rootViewController: RepoTableViewController())
        repositoriesVC.tabBarItem.image = UIImage(named: "repo")?.resizeImage(to: iconSize)
        repositoriesVC.tabBarItem.title = "Repositories"
        
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem.image = UIImage(named: "search")?.resizeImage(to: iconSize)
        searchVC.tabBarItem.title = "Search"
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem.image = UIImage(named: "profile")?.resizeImage(to: iconSize)
        profileVC.tabBarItem.title = "Profile"
        
        viewControllers = [repositoriesVC, searchVC, profileVC]
    }
}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image {
            _ in draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
