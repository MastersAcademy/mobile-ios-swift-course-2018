//
//  ViewController.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 12/22/18.
//  Copyright © 2018 MastersAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    // MARK: property
    private let notificationCenter: NotificationCenter = .default
    private var tapGestureHideKeyBoard: UITapGestureRecognizer!
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureHideKeyBoard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startObservingKeyboardChanges()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopObservingKeyboardChanges()
    }
    
    // MARK: observing keyboard changes
    func startObservingKeyboardChanges() {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    func stopObservingKeyboardChanges() {
        notificationCenter.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // MARK: scroll to view
    func scrollToTextField(_ textField: UITextField, animated: Bool = true) {
        let distanseToBottom = scrollView.frame.height - textField.frame.maxY
        scrollView.setContentOffset(CGPoint(x: 0, y: distanseToBottom), animated: animated)
    }
    
    // MARK: IBAction
    @IBAction func touchSingup(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    // MARK: keyboard show/hide
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        view.addGestureRecognizer(tapGestureHideKeyBoard)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
        view.removeGestureRecognizer(tapGestureHideKeyBoard)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
        scrollView.setContentOffset(.zero, animated: true)
    }
}

// MARK: - extension: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.nextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollToTextField(textField)
    }
}

