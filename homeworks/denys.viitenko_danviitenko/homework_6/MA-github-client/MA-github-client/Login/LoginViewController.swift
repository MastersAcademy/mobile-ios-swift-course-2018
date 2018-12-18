//
//  ViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/16/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let user = LoginData.lock()
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInButton(_ sender: Any) {
        if loginTextField.text == user.email && passwordTextField.text == user.password{
            self.performSegue(withIdentifier: "tabBar" , sender: self)
            
        } else {
            alert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func alert(){
        let alert = UIAlertController(title: "Error", message: "Invalid password",
                                      preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}



