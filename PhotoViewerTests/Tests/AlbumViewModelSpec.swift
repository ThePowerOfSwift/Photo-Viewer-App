//
//  AlbumsTableViewCellSpec.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/18/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Quick
import Nimble
@testable import PhotoViewer

class AlbumViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("Variables") {
            var albumViewModel = AlbumTableViewCell.AlbumsViewModel(albumId: 1000)
            
            albumViewModel.noOfPhotos = 25
            describe("Album Text Display") {
                it("should correctly display the album text") {
                    expect(albumViewModel.albumIdTextDisplay).to(equal("Album 1000"))
                }
                it("should correctly display the no Of Photos text") {
                    expect(albumViewModel.noOfPhotosDisplay).to(equal("25 photos"))
                }
            }
        }
    }
    
}
