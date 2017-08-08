//
//  AlbumsDataStore.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/8/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

class AlbumsDataStore {
    
    static let sharedInstance = AlbumsDataStore()
    let albums: [String:Any] = [:]
    let photos: [Photo] = []
    
    
    func getAlbumsFromAPIClient() {
        
    }
    
    
}
