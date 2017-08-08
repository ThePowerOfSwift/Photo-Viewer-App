//
//  APIClient.swift
//  PhotoViewer
//
//  Created by Jhantelle Belleza on 8/8/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class APIClient {
    
//    let url = "http://jsonplaceholder.typicode.com/photos"
    
    public static func getAlbumsFromAPI(from url: String, completion: @escaping ([String: Any], String?) -> Void) {
        var albums = [String:Any]()
        var errorResponse: String?
        
        Alamofire.request(url).responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                guard let data = JSON(value).dictionaryObject else {
                    return
                }
                albums = data
            case .failure(let error):
                print(error.localizedDescription)
                errorResponse = error.localizedDescription
            }
         completion(albums, errorResponse)
        }
    }
}
