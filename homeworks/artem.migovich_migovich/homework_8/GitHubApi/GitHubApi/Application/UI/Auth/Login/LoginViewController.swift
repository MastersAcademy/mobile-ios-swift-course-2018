//
//  LoginViewController.swift
//  GitHubApi
//
//  Created by Myhovych on 1/20/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = UIImage(named: "logo")
        configureTapGasture()
        self.usernameTextField.delegate = self
    }

    @IBAction func confirmDidPressed(_ sender: Any) {
        let nextViewController = ProfileViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
        nextViewController.username = usernameTextField.text!
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //Keyboard settings
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.confirmDidPressed(UIButton())
        return false
    }
    
    private func configureTapGasture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
