//
//  AppDelegate.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 12/22/18.
//  Copyright © 2018 MastersAcademy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var store: Store<AppState> = Store<AppState>(state: .initial,
                                                 reducer: { state, action in
    switch action {
    case  let action as ChangeNameAction:
        
        return AppState.init(user: User.init(name: action.value))
    default: return state
                                                    }
                                                    
    })


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let controller = window?.rootViewController as? ViewController
        
        let observer = CommandWith<AppState> { [store] state in
            controller?.props = ViewController.Props(firstNamePlaceholder: "First Name",
                                                     firstNameChange: CommandWith<String>() {
                                                        store.dispatch(action: ChangeNameAction(value: $0))
                },
                                                     firstName: state.user.name,
                                                     lastNamePlaceholder: "",
                                                     lastNameChange: .nop,
                                                     lastName: "",
                                                     emailPlaceholder: "",
                                                     emailChange: .nop,
                                                     email: "",
                                                     passwordPlaceholder: "",
                                                     passwordChange: .nop,
                                                     password: "",
                                                     signUpButtonTitle: "",
                                                     signUpTap: .nop,
                                                     logoImageName: "",
                                                     logoTap: .nop)
        }
        store.observe(with: observer.dispatched(on: .main))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

