//
//  LoginViewController.swift
//  GitHubApi
//
//  Created by Myhovych on 1/20/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logoImageView.image = UIImage(named: "9919")
    }
    
    @IBAction func singInDidPressed(_ sender: Any) {
        let nextViewController = ProfileViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
        nextViewController.username = usernameTextField.text!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
