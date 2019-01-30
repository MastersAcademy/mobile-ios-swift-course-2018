//
//  FindViewController.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import UIKit

class FindViewController: BasicViewController {

    // MARK: IBOutlet
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var tfUsername: UITextField!
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: IBAction
    @IBAction func touchSearch(_ sender: UIButton) {
        
        guard let text = tfUsername.text else {
            showError(massage: "Username is empty.\nPlease anter username and try again!")
            return
        }
        
        ApiHelper.searchUser(by: text) { [weak self] result in
            guard let `self` = self else { return }
            do {
                let value = try result.getValue()
                DispatchQueue.main.async {
                    let profileVC = ProfileViewController()
                    profileVC.presentation = value
                    self.navigationController?.pushViewController(profileVC, animated: true)
                }
            } catch {
                self.showError(massage: error.localizedDescription)
            }
        }
    }
    
    func showError(massage: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: "Error!", message: massage, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(okAction)
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}

extension FindViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


