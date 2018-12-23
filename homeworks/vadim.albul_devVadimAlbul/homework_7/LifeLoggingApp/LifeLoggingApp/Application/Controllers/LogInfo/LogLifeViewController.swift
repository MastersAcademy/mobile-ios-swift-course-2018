//
//  LogLifeViewController.swift
//  LifeLogging
//
//  Created by Vadim Albul on 12/23/18.
//  Copyright © 2018 Vadim Albul. All rights reserved.
//

import UIKit

class LogLifeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.theClassName): \(#function) 📲👇")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self.theClassName): \(#function) 📥")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(self.theClassName): \(#function) 🤲📱")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self.theClassName): \(#function) 👋")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(self.theClassName): \(#function) 👋🚪")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("\(self.theClassName): \(#function) 😱⚠️💾")
    }
    
    deinit {
        print("\(self.theClassName): \(#function) 👋")
    }
}
