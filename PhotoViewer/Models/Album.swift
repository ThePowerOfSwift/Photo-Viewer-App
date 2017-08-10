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
    
    var albumId: Int
    var photos: [Photo] {
        willSet {
            self.noOfPhotos = self.photos.count
        }
    }
    
    var noOfPhotos: Int = 0
    
    init(albumId: Int, photos: [Photo]) {
        self.albumId = albumId
        self.photos = photos
    }
    
}
