//
//  LoginViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/16/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let user = LoginPresentation.makeMock()
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInButton(_ sender: Any) {
        if loginTextField.text == user.email && passwordTextField.text == user.password{
            performSegue(withIdentifier: Segues.Identifier.tabBar , sender: self)
        } else {
            presentAuthorizationErrorAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func presentAuthorizationErrorAlert(){
        let alert = UIAlertController(title: "Error", message: "Invalid password",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
