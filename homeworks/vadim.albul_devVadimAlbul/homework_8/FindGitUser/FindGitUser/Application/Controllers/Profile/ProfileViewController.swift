//
//  ProfileViewController.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import UIKit

class ProfileViewController: BasicViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var lblRepost: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var txtContentView: UITextView!
    
    // MARK: property
    private var profilePresentation: UserProfile? {
        set {
            presentation = newValue
        }
        get {
            return presentation as? UserProfile
        }
    }
    private var sessionTask: URLSessionDataTask?

    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sessionTask?.cancel()
    }
    
    // MARK: update UI
    override func updateUIWithPresentation() {
        super.updateUIWithPresentation()
        let profile = profilePresentation
        sessionTask = avatarImageView.loadImage(by: profile?.avatarURL, with: #imageLiteral(resourceName: "avatar-default"))
        lblFirstName.text = profile?.login
        lblLastName.text = profile?.name
        lblFollowers.text = "❤︎ \(profile?.followers ?? 0)"
        lblRepost.text = "❐ \(profile?.publicRepos ?? 0)"
        
        txtContentView.attributedText = nil
        DispatchQueue.global().async {
            let content = profile?.htmlContent
            DispatchQueue.main.async {
                self.txtContentView.attributedText = content
            }
        }
        
    }
}
