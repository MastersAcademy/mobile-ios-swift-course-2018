//
//  LogLifeViewController.swift
//  LifeLogging
//
//  Created by Igor Medelyan on 1/2/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit

class LogLifeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🍾" + description + "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("🥃" + description + "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("🍺" + description + "viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("🥃" + description + "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("🍽" + description + "viewDidDisappear")
    }
}
