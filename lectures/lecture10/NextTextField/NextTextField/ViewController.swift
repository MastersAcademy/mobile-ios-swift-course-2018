//
//  ViewController.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 12/22/18.
//  Copyright © 2018 MastersAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct Props: Codable {
        var firstNamePlaceholder: String
        var firstNameChange: CommandWith<String>
        var firstName: String
        var lastNamePlaceholder: String
        var lastNameChange: CommandWith<String>
        var lastName: String
        var emailPlaceholder: String
        var emailChange: CommandWith<String>
        var email: String
        var passwordPlaceholder: String
        var passwordChange: CommandWith<String>
        var password: String
        var signUpButtonTitle: String
        var signUpTap: Command
        var logoImageName: String
        var logoTap: Command
        
    }
    
    var props: Props = Props(firstNamePlaceholder: "",
                             firstNameChange: .nop,
                             firstName: "",
                             lastNamePlaceholder: "",
                             lastNameChange: .nop,
                             lastName: "",
                             emailPlaceholder: "",
                             emailChange: .nop,
                             email: "",
                             passwordPlaceholder: "",
                             passwordChange: .nop,
                             password: "",
                             signUpButtonTitle: "",
                             signUpTap: .nop,
                             logoImageName: "",
                             logoTap: .nop) {
        didSet {
            view.setNeedsLayout()
        }
    }

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupKeyboard()
        setupSignupButton()
        setupTextFields()
        setupBackgroundTap()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        render(props: props)
    }
    
    private func setupKeyboard() {
        let center = NotificationCenter.default
        center.addObserver(self,
                           selector: #selector(handlekeyboardWillChangeFrame(notitification:)),
                           name: UIResponder.keyboardWillChangeFrameNotification,
                           object: nil)
        center.addObserver(self,
                           selector: #selector(handleKeyboardWillHide(notitification:)),
                           name: UIResponder.keyboardWillHideNotification,
                           object: nil)
        
    }
    
    private func setupSignupButton() {
        
    }
    
    private func setupTextFields() {
        bindTextFieldChanged(firstNameTextField, to: #selector(handleFirstNameChanged))
        bindTextFieldChanged(lastNameTextField, to: #selector(handleLastNameChanged))
        bindTextFieldChanged(emailTextField, to: #selector(handleEmailChanged))
        bindTextFieldChanged(passwordTextField, to: #selector(handlePasswordChanged))
    }
    
    private func bindTextFieldChanged(_ textField: UITextField, to selector: Selector) {
        textField.addTarget(self,
                            action: selector,
                            for: .editingChanged)
    }
    
    private func setupBackgroundTap() {
        let recognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleBackground))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc
    private func handleBackground() {
        view.endEditing(true)
    }
    
    private func render(props: Props) {
        signUpButton.setTitle(props.signUpButtonTitle, for: .normal)
        firstNameTextField.placeholder = props.firstNamePlaceholder
        updateTextIfNeeded(in: firstNameTextField, with: props, using: \.firstName)
        lastNameTextField.placeholder = props.lastNamePlaceholder
        updateTextIfNeeded(in: lastNameTextField, with: props, using: \.lastName)
        emailTextField.placeholder = props.emailPlaceholder
        updateTextIfNeeded(in: emailTextField, with: props, using: \.email)
        passwordTextField.placeholder = props.passwordPlaceholder
        updateTextIfNeeded(in: passwordTextField, with: props, using: \.password)
    }
    
    @objc
    private func handleSignUpTap() {
        props.signUpTap.perform()
    }
    
    @objc
    private func handlekeyboardWillChangeFrame(notitification: Notification) {
        scrollView.contentInset =
            insetsForKeyboard(show: true,
                              userInfo: notitification.userInfo as? [String: NSValue] ?? [:],
                              in: view)
    }
    
    @objc
    private func handleKeyboardWillHide(notitification: Notification) {
        scrollView.contentInset = .zero
    }
    
    @objc
    func handleFirstNameChanged() {
        props.firstNameChange.perform(with: firstNameTextField.text ?? "")
    }
    
    @objc
    func handleLastNameChanged() {
        props.lastNameChange.perform(with: lastNameTextField.text ?? "")
    }
    
    @objc
    func handlePasswordChanged() {
       props.passwordChange.perform(with: passwordTextField.text ?? "")
    }
    
    @objc
    func handleEmailChanged() {
        props.emailChange.perform(with: emailTextField.text ?? "")
    }
    
    private func insetsForKeyboard(show: Bool, userInfo: [String: NSValue], in view: UIView) -> UIEdgeInsets {
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey]?.cgRectValue, show else { return .zero }
        return UIEdgeInsets.init(top: 0, left: 0, bottom:  view.convert(keyboardFrame, from: view).height, right: 0)
    }
    
    private func updateTextIfNeeded<T>(in textField: UITextField,
                                    with source: T,
                                    using keyPath: KeyPath<T, String>) {
        guard !textField.isFirstResponder else { return }
        textField.text = source[keyPath: keyPath]
    }
    
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
}


