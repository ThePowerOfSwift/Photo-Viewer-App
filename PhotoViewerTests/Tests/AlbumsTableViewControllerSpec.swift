//
//  AlbumsViewControllerSpec.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/17/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import PhotoViewer

class AlbumsTableViewControllerSpec: QuickSpec {
    
    class FakeAlbumService: AlbumFetching {
        
        func getAlbumsFromAPIClient(completion: @escaping (AlbumDataResult) -> Void) {
            completion(AlbumDataResult.Success([]))
        }
    }
    
    override func spec() {
        
        var albumsTableViewController: AlbumsTableViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
            albumsTableViewController = navigationController.topViewController as! AlbumsTableViewController
            
            UIApplication.shared.keyWindow!.rootViewController = navigationController
            let _ = navigationController.view
            let _ = albumsTableViewController.view
        }
        
        describe("getAlbums") {
            context("Albums fetched successfully") {
                it("Gets the album from the data source") {
                    
                    _ = FakeAlbumService()
                    
                    let albums = [Album(albumId: 1), Album(albumId: 2), Album(albumId: 3)]
                    //  albumsTableViewController.getAlbums(albumService: fakeAlbumService)
                    expect(albums.count).to(equal(albumsTableViewController.albums?.count))
                }
            }
        }
    }
}

