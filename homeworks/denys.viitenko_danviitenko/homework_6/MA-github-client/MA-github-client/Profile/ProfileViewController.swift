//
//  ProfileViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var profile = ProfilePresentation.makeMock()
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        
    }
    func setProfile(){
        let imageName = profile.imageName ?? "githubImage"
        UIImage(named: imageName).map {
            imageView.image = $0
        }
        nickLabel.text = profile.nick
        nameTextField.text = profile.name
        surnameLabel.text = profile.surname
        mailTextField.text = profile.mail
        countryTextField.text = profile.country
    }
    
}
