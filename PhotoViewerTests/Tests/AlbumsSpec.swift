//
//  AlbumsTableViewControllerTests.swift
//  PhotoViewerTests
//
//  Created by Jhantelle Belleza on 8/9/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Quick
import Nimble
@testable import PhotoViewer

class AlbumSpec: QuickSpec {
    
    override func spec() {
        describe("Album") {
            
            let photo1 = Photo(id: 1, title: "Cat Photo")
            let photo2 = Photo(id: 2, title: "Dog Photo")
            let photo3 = Photo(id: 2, title: "Bird Photo")
            let photos = [photo1, photo2, photo3]
            var album = Album(albumId: 23)
            
            beforeEach({ () -> () in
                album = Album(albumId: 23)
            })
            
            describe("An album") {
                context("After being properly initialized as an album") {
                    it("sets the albumId") {
                        expect(album.albumId) == 23
                    }
                    it("should have 0 photos") {
                        expect(album.photos.count) == 0
                    }
                }
            }
            
            describe("Photos property") {
                it("can take photo objects") {
                    album.photos.append(contentsOf: photos)
                    expect(album.photos.count) == 3 }
                it("assigns the array count of photos to no of Photos") {
                    expect(album.noOfPhotos) == album.photos.count
                }
            }
        }
    }
}
