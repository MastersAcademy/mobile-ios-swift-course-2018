//
//  ProfileViewController.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import UIKit

class ProfileViewController: BasicViewController {

    // MARK: IBOutlet
    @IBOutlet weak var lblNickname: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tvBio: UITextView!
    @IBOutlet weak var tfCountry: UITextField!
    
    // MARK: property
    private var requestTask: URLSessionDataTask?
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentation = UserProfile.default
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        requestTask?.cancel()
        requestTask = nil
        super.viewDidDisappear(animated)
    }
    
    // MARK: update UI
    override func updateUIWithPresentation() {
        guard let profile = presentation as? UserProfile else { return }
        lblNickname.text = profile.nickname
        tfName.text = profile.name
        lblEmail.text = profile.email
        tvBio.text = profile.bio
        tfCountry.text = profile.country
        if let url = profile.avatarURL {
            requestTask = imgView.loadImage(by: url, placeholder: #imageLiteral(resourceName: "default-img"))
        }
    }

    // MARK: target action
    @IBAction func changedName(_ sender: UITextField) {
        guard let profile = presentation as? UserProfile else { return }
        profile.name = sender.text ?? ""
    }
    
    @IBAction func changedCountry(_ sender: UITextField) {
        guard let profile = presentation as? UserProfile else { return }
        profile.country = sender.text
    }
}

// MARK: property
extension ProfileViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        guard let profile = presentation as? UserProfile else { return }
        if textView == tvBio {
            profile.bio = textView.text
        }
    }
}

