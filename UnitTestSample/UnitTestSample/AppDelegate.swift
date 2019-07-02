//
//  AppDelegate.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 17/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        window?.rootViewController = homeViewController

        window?.makeKeyAndVisible()
        
        return true
    }
    
}

