//
//  LoginViewController.swift
//  MA-github-client
//
//  Created by Maksym Savisko on 12/12/18.
//  Copyright © 2018 Maksym Savisko. All rights reserved.
//

import UIKit.UIViewController

class LoginViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var presentation: LoginPresentation? {
        willSet {
            loadViewIfNeeded()
        }
        didSet {
            updateViewWithPresentation()
        }
    }
    
    func updateViewWithPresentation() {
        presentation.map { item in
            
        }
    }
    
    @IBAction func confirmDidPressed(_ sender: UIButton) {
        let nextViewController = RepositoriesViewController()
        nextViewController.presentation = RepositoriesPresentation.makeDefault()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.pushViewController(nextViewController,
                                                 animated: true)
    }
}
