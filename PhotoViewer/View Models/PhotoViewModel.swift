//
//  PhotoViewModel.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/9/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import SDWebImage

final class DisplayPhoto {

    struct PhotoViewModel {
        var photo: Photo
        
        init(photo: Photo) {
            self.photo = photo
        }
    }

    var photoViewModel: PhotoViewModel?
    
    var thumbnailImageView: UIView? {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let imageView = UIImageView()
        guard let url = photoViewModel?.photo.thumbnailImageUrl else { return imageView }
        let frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: URL(string: url))
        tempView.addSubview(imageView)
        return tempView
    }
    
    init() {
        
    }
    
}

