//
//  UIApplication+Extension.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var rootViewController: UIViewController? {
        return shared.keyWindow?.rootViewController
    }
    
    
    class func topViewController(rootViewController: UIViewController? = rootViewController) -> UIViewController? {
        
        guard let rootViewController = rootViewController else {
            return nil
        }
        
        switch rootViewController {
        case let (rootVC as UITabBarController):
            return topViewController(rootViewController: rootVC.selectedViewController)
        case let (rootVC as UINavigationController):
            return topViewController(rootViewController: rootVC.visibleViewController)
        case let rootVC where rootVC.presentedViewController != nil:
            return topViewController(rootViewController: rootVC.presentedViewController)
        default:
            return rootViewController
        }
    }
    
    static var presentedViewController: UIViewController? {
        return UIApplication.topViewController()
    }

}
