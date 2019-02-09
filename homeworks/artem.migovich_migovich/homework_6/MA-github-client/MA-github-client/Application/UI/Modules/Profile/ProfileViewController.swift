//
//  ProfileViewController.swift
//  MA-github-client
//
//  Created by Myhovych on 12/17/18.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    var profile = ProfilePresentation.makeMock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        setProfile()
    }
    
    func setProfile() {
        profileImageView.image = UIImage(named: profile.imageName)
        nameLabel.attributedText = profile.name
        nicknameLabel.attributedText = profile.nickname
        bioLabel.text = profile.bio
        companyLabel.text = profile.company
        countryLabel.text = profile.country
        emailLabel.attributedText = profile.email
        websiteLabel.attributedText = profile.website
    }
}
 
