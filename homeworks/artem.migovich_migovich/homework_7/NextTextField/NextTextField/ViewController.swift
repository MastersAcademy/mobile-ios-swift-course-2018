//
//  ViewController.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 12/22/18.
//  Copyright © 2018 MastersAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGasture()
        notifications()
    }
    
    private func notifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            guard view.frame.origin.y == 0 else { return }
            self.view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        guard view.frame.origin.y != 0 else { return }
        self.view.frame.origin.y = 0
    }
    
    private func configureTextFields() {
        let collectionTextFields: [UITextField] = [firstNameTextField, lastNameTextField, emailTextField, passwordTextField]
        for textField in collectionTextFields {
            textField.delegate = self
            textField.autocorrectionType = .no
        }
    }
    
    private func configureTapGasture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            firstNameTextField.becomeFirstResponder()
        default:
            break
        }
        
        return true
    }
    
}
