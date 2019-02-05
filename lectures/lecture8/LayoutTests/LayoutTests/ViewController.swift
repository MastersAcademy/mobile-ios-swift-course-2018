//
//  ViewController.swift
//  LayoutTests
//
//  Created by Anton Popovichenko on 1/16/19.
//  Copyright © 2019 MasterOfCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageTrailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if traitCollection.horizontalSizeClass == .regular {
            
        }
    }
}

