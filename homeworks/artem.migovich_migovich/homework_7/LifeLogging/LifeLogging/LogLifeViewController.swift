//
//  LogLifeViewController.swift
//  LifeLogging
//
//  Created by Myhovych on 1/15/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class LogLifeViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        greeting(emoji: "☀️", name: "init nibName")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        greeting(emoji: "☀️", name: "init coder")
    }
    
    override func awakeFromNib() {
        greeting(emoji: "🌤", name: "awakeFromNib")
    }
    
    override func loadView() {
        super.loadView()
        greeting(emoji: "⛅️", name: "loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greeting(emoji: "🌥", name: "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        greeting(emoji: "☁️", name: "viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        greeting(emoji: "🌦", name: "viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greeting(emoji: "🌧", name: "viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        greeting(emoji: "⛈", name: "viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        greeting(emoji: "☔️", name: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        greeting(emoji: "☂️", name: "viewDidDisappear")
    }
    
    deinit {
        greeting(emoji: "☄️", name: "deinit")
    }
    
    func greeting(emoji: String, name: String) {
        var className: String
        {
            return String(describing: LogLifeViewController.self)
        }
        print("\(emoji) Class: \(className) - Method: \(name)")
    }
}
