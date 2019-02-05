//
//  BasicViewController.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {

    // MARK: property
    var presentation: BasicPresentation? {
        willSet {
            loadViewIfNeeded()
        }
        didSet {
            updateUIWithPresentation()
        }
    }
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: update UI
    func updateUIWithPresentation() {
        
    }

}
