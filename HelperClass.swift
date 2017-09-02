//
//  HelperClass.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/18/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import SwiftSpinner

class HelperClass {
    
    static var isNetworkReachable: Bool {
        get {
            return checkReachability()
        }
    }
    
    static let manager  = NetworkStatus.reachabilityManager
    
    fileprivate static func checkReachability() -> Bool {
        guard (manager?.isReachable) == true else {
            SwiftSpinner.show("Make sure device is connected to the internet.").addTapHandler({
                SwiftSpinner.hide()
            }, subtitle: "This app requires internet connection. Connect to a wifi or turn on mobile data. Tap to hide.")    
            return false
        }
        return true
    }
    
    static public func stopListening() {
        manager?.stopListening()
    }

}
