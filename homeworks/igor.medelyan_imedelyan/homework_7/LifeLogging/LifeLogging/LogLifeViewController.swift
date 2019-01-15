//
//  LogLifeViewController.swift
//  LifeLogging
//
//  Created by Igor Medelyan on 1/2/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit

class LogLifeViewController: UIViewController {
    
    let name = String(describing: LogLifeViewController.self)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("🍼 " + name + " init nibName")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("🥛 " + name + " init coder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("🍶 " + name + " awakeFromNib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🍾 " + name + " viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("🥃 " + name + " viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("🍺 " + name + " viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("🥃 " + name + " viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("🍽 " + description + " viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("🌰 " + name + " didReceiveMemoryWarning")
    }
    
    deinit {
        print("♻︎ " + name + " deinit")
    }
}
