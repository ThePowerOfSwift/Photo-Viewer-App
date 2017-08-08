//
//  APIClientTest.swift
//  PhotoViewerTests
//
//  Created by Jhantelle Belleza on 8/8/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class APIClientTest: XCTestCase {
    
    //Mock Test for API Calls
    func testGetAlbumsFromAPI() {
        let expect = expectation(description: "Download succeeds")
        let testUrl = "http://httpbin.org/anything"
        
        APIClient.getAlbumsFromAPI(from: testUrl) { (response, error) in
            XCTAssertNil(error, "Unexpected error occured: \(String(describing: error))")
            XCTAssertNotNil(response, "Downloaded response")
            print(response)
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test timed out. \(String(describing: error?.localizedDescription))")
        }
    }
}

