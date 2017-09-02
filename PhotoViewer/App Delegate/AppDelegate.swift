//
//  AppDelegate.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import SwiftSpinner

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //let networkStatus = NetworkStatus.sharedInstance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //Check for reachability
        if HelperClass.isNetworkReachable {
            HelperClass.stopListening()
        }
    }
    
    
    

}

