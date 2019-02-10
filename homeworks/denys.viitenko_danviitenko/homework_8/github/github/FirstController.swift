//
//  FirstController.swift
//  github
//
//  Created by Dan on 1/20/19.
//  Copyright © 2019 Dan Viitenko. All rights reserved.
//

import UIKit

class FirstController: UIViewController {
    var username = ""
    @IBOutlet weak var usernameTextField: UITextField!
    var repo: UserRepo?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func findButton(_ sender: Any) {
        keyboardDidHide()
        username = usernameTextField.text!
        if username == usernameTextField.text!, username != "" {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        updateUser()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardDidHide))
        view.addGestureRecognizer(tap)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    @objc func keyboardWillShow(_ notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y -= keyboardHeight
        }
    }
    @objc func keyboardDidHide(){
        self.view.frame.origin.y = 0.0
        view.endEditing(true)
    }

    func updateUser(){
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.sync {
            guard let url = URL(string: "https://api.github.com/users/\(username)") else {
                return presentErrorAlert()
            }
            let request = NSMutableURLRequest(url: url)
            URLSession.shared.dataTask(with: request as URLRequest){ (data, response, error) in
                if error != nil{
                    print(error!.localizedDescription)
                    return
                }
                do{
                    let json = try JSONDecoder().decode(UserRepo.self, from: data!)
                        DispatchQueue.main.async {
                            self.repo = json
                            self.activityIndicatorStop()
                            self.performSegue(withIdentifier: "showSecondVC" , sender: self)
                          
                        }
                    
                }catch _{
                    self.presentErrorAlert()
                    DispatchQueue.main.async {
                        self.activityIndicatorStop()
                    }
                }
                }.resume()
        }
    }
    func presentErrorAlert(){
        let alert = UIAlertController(title: "Error", message: "Invalid name",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showSecondVC", let secondViewController = segue.destination as? SecondViewController {
                if repo != nil{
                secondViewController.user = repo
                secondViewController.username = username
        }
    }
}
    func activityIndicatorStop(){
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
}
