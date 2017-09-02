//
//  NetworkStatus.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/18/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import Alamofire
import SwiftSpinner

class NetworkStatus {
    
    fileprivate init() { }
    
    static let reachabilityManager = Alamofire.NetworkReachabilityManager(host: Constants.defaultURL)
    
    static func startNetworkReachabilityObserver() {
        reachabilityManager?.listener = { status in
            
            switch status {
                
            case .notReachable:
                print("The network is not reachable")
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            }
        }
        reachabilityManager?.startListening()
    }
}
