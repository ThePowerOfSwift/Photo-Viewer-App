//
//  AlbumsDataStoreSpec.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/18/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Mockingjay
@testable import PhotoViewer

class AlbumsDataStoreSpec: QuickSpec {
    
    var dataResultFromAPI: [Album]!
    
    override func spec() {
        
        let albumsDataStore = AlbumsDataStore()
        
        describe("getAlbums") {
            context("Albums fetched successfully") {
                it("Gets the album from the data source") {
                    guard let path = Bundle.main.path(forResource: "GetAlbumsSuccess", ofType: "json") else { return }
                    let data = NSData(contentsOfFile: path)!
                    self.stub(uri(Constants.defaultURL), jsonData(data as Data))
                    
                    /*APIClient.getAlbumsFromAPI(from: Constants.defaultURL) { dataResult in
                     switch dataResult {
                     case .Success(let testAlbum):
                     dataResultFromAPI = testAlbum
                     case .Failure(let error):
                     print(error)
                     } */
                    albumsDataStore.getAlbumsFromAPIClient(completion: { (dataResult, error) in
                        self.dataResultFromAPI = dataResult
                    })
                    expect(self.dataResultFromAPI).toEventuallyNot(beNil())
                        expect(self.dataResultFromAPI.count).to(equal(1))
                    
                    self.dataResultFromAPI.forEach{
                        album in
                        expect(album.albumId).to(equal(1))
                        expect(album.noOfPhotos).to(equal(30))
                    }
                }
            }
        }
    }
}
