//
//  SearchUserViewController.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit

class SearchUserViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextFiled: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    private lazy var presenter = SearchUserPresenter(with: self)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - IBActions
    @IBAction private func searchUserButtonAction(_ sender: UIButton) {
        presenter.getInfo(for: usernameTextFiled.text!)
    }
    
    // MARK: - View update
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setLoading(hidden: Bool) {
        hidden ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()
    }
    
    func show(errorMessage: String?) {
        errorLabel.text = errorMessage
    }
    
    func navigateToUserProfileScreen(user: GitHubUser, repositories: [Repository]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController else { return }
        vc.user = user
        vc.repositories = repositories
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
