//
//  ViewController.swift
//  MALogo
//
//  Created by Dan on 12/8/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 3, delay: 1, options: [], animations: {
           self.maView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
    }

}

