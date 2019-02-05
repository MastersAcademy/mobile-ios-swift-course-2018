//
//  LogLifeViewController.swift
//  LifeLogging
//
//  Created by Dan on 12/23/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit

class LogLifeViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("\(self.classForCoder) \(#function) "+"✒️")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("\(self.classForCoder) \(#function) "+"⛔️")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\(self.classForCoder) \(#function) "+"🌄")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.classForCoder) \(#function) "+"📱")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self.classForCoder) \(#function) "+"📲")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(self.classForCoder) \(#function) " + "📲📱")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self.classForCoder) \(#function) "+"🚮")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(self.classForCoder) \(#function) "+"🗑")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("\(self.classForCoder) \(#function) "+"🧠")
    }
    deinit {
        print("\(self.classForCoder) \(#function) " + "🚮🗑")
    }

}
