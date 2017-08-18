//
//  PhotoSpec.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/17/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Quick
import Nimble
@testable import PhotoViewer

class PhotoSpec: QuickSpec {
    
    override func spec() {
        describe("Photo") {
            let photo1 = Photo(id: 1, title: "Cat Photo")
            let photo2 = Photo(id: 2, title: "Dog Photo")
            let photo3 = Photo(id: 3, title: "Fish Photo")
            
            photo1.photoImageUrl = "https://static.pexels.com/photos/315582/pexels-photo-315582.jpeg"
            
            photo1.thumbnailImageUrl = "http://68.media.tumblr.com/5bd355c5e63ea2440c4d190ea74b8dd6/tumblr_inline_o25dc7kwN21seilga_500.jpg"
            
            
            describe("initializer") {
                it("should set id property") {
                    expect(photo1.id).to(equal(1))
                    expect(photo2.id).to(equal(2))
                    expect(photo3.id).to(equal(3))
                }
                it("should set title property") {
                    expect(photo1.title).to(equal("Cat Photo"))
                    expect(photo2.title).to(equal("Dog Photo"))
                    expect(photo3.title).to(equal("Fish Photo"))
                }
                it("can take a photo url") {
                    expect(photo1.photoImageUrl).to(equal("https://static.pexels.com/photos/315582/pexels-photo-315582.jpeg"))
                }
                it("can take a thumbnail url") {
                expect(photo1.thumbnailImageUrl).to(equal("http://68.media.tumblr.com/5bd355c5e63ea2440c4d190ea74b8dd6/tumblr_inline_o25dc7kwN21seilga_500.jpg"))                }
            }
        }
        
    }
    
    
}
