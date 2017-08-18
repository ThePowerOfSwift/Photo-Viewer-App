//
//  PhotoViewModelSpec.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/18/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Quick
import Nimble
@testable import PhotoViewer

class PhotoViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("Variables") {
            let photo1 = Photo(id: 1, title: "Cat Photo")
            photo1.photoImageUrl = "https://static.pexels.com/photos/315582/pexels-photo-315582.jpeg"
            
            photo1.thumbnailImageUrl = "http://68.media.tumblr.com/5bd355c5e63ea2440c4d190ea74b8dd6/tumblr_inline_o25dc7kwN21seilga_500.jpg"
            
            
            let photoViewModel = DisplayPhoto.PhotoViewModel(photo: photo1)
            
            describe("Photo Details") {
                it("should correctly display the photo title") {
                    expect(photoViewModel.photo.title).to(equal("Cat Photo"))
                }
                describe("Photo Thumbnail Image View") {
                    expect(photoViewModel.photo.thumbnailImageUrl).toNot(beNil())
                }
            }
        }
    }
    
}
