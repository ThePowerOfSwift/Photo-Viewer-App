//
//  Helper.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/8/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import SDWebImage

//MARK: AlbumTableViewCell's Albums View Model
extension AlbumTableViewCell.AlbumsViewModel {
    
    var albumIdTextDisplay: String {
        let formatString = NSLocalizedString("ALBUM %@", comment: "...")
        return String(format: formatString, String(albumId))
    }
    
    var noOfPhotosDisplay: String {
        var photoDisplayString = "photo"
        if noOfPhotos > 1 {
            photoDisplayString = "photos"
        }
        let formatString = NSLocalizedString("%@ \(photoDisplayString)", comment: "...")
        return String(format: formatString, String(noOfPhotos))
    }    
}




