//
//  NextViewController.swift
//  LifeLogging
//
//  Created by Vadim Albul on 12/23/18.
//  Copyright © 2018 Vadim Albul. All rights reserved.
//

import UIKit

class NextViewController: LogLifeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
