//
//  ProfileViewController.swift
//  MA-github-client
//
//  Created by Dan on 12/17/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var profile = ProfileData(imageView: nil, nickLabel: "DanViitenko", nameLabel: "Denys", surnameLabel: "Viitenko", mailLabel: "new@gmail.com", countryLabel: "Ukraine")
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var nameTextF: UITextField!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var mailTextF: UITextField!
    
    @IBOutlet weak var countryTextF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        
    }
    func setProfile(){
        if profile.imageView != nil {
            imageView.image = UIImage(named: profile.imageView!)
            
        }else{
            imageView.image = UIImage(named: "githubImage")
        }
        nickLabel.text = profile.nickLabel
        nameTextF.text = profile.nameLabel
        surnameLabel.text = profile.surnameLabel
        mailTextF.text = profile.mailLabel
        countryTextF.text = profile.countryLabel
    }
    
}
