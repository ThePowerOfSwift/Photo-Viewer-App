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
import SDWebImage

public class APIClient {
    
    public static func getAlbumsFromAPI(from url: String, completion: @escaping ([[String: Any]], String?) -> Void) {
        var photos: [[String:Any]] = []
        var errorResponse: String?
        
        Alamofire.request(url).responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                guard let data = JSON(value).arrayObject as? [[String:Any]] else {
                    return
                }
                photos = data
            case .failure(let error):
                print(error.localizedDescription)
                errorResponse = error.localizedDescription
            }
         completion(photos, errorResponse)
        }
    }
}
