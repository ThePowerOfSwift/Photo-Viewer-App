//
//  Album.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

struct Album {
    
    var albumID: Int
    var photos: [Photo] {
        didSet {
            self.noOfPhotos = photos.count
        }
    }
    
    var noOfPhotos: Int
    
}
