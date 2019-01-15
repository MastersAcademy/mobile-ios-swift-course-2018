//
//  LogLifeViewController.swift
//  LifeLogging
//
//  Created by Myhovych on 1/15/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class LogLifeViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        greeting(name: "loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greeting(name: "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        greeting(name: "viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        greeting(name: "viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greeting(name: "viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        greeting(name: "viewDidAppear")
    }
    
    func greeting(name: String) {
        var className: String
        {
            return String(describing: LogLifeViewController.self)
        }
        print("👋 Class: \(className) - Method: \(name)")
    }
}
