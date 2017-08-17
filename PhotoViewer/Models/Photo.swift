//
//  PhotoModel.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class Photo {
    
    var id: Int
    var title: String
    var photoImageUrl: String?
    var thumbnailImageUrl: String?
    
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
}
