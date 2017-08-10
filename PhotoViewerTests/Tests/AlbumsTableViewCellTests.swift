//
//  AlbumsTableViewCellTests.swift
//  PhotoViewerTests
//
//  Created by Jhantelle Belleza on 8/9/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class AlbumsTableViewCellTests: XCTestCase {
    
    var cell: AlbumsTableViewCell?
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: self.classForCoder)
        guard let nib = bundle.loadNibNamed("AlbumsTableViewCell", owner: nil, options: nil)?.first as? AlbumsTableViewCell else { return }
        cell = nib
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStringExtensions() {
        
        var albumsViewModel = AlbumsTableViewCell.AlbumsViewModel(albumId: 23)
        albumsViewModel.noOfPhotos = 2
        
        cell?.albumTitleLabel.text = albumsViewModel.albumIdTextDisplay
        cell?.noOfPhotosLabel.text = albumsViewModel.noOfPhotosDisplay
        
        XCTAssertEqual(cell?.albumTitleLabel.text, "Album 23")
        XCTAssertEqual(cell?.noOfPhotosLabel.text, "2 photos")
        
    }
    
}
