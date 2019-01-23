 //
//  LoginViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 12/15/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
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
        let nextViewController = MainTabBarViewController()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.pushViewController(nextViewController,
                                                 animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Log Out"
    }
}
