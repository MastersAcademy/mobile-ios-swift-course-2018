//
//  AppDelegate.swift
//  RememberMe-2
//
//  Created by Igor Medelyan on 11/24/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = ViewController()
//        initialViewController.view.backgroundColor = .blue
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        return true
    }
}

