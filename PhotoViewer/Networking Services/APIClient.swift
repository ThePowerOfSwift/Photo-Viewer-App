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

protocol FetchData {
    static func getAlbumsFromAPI(from url: String, completion: @escaping (AlbumDataResult) -> Void)
}

enum AlbumDataResult {
    case Success([[String:Any]])
    case Failure(Error)
}


public class APIClient: FetchData {
    
    static func getAlbumsFromAPI(from url: String, completion: @escaping (AlbumDataResult) -> Void) {
        
        Alamofire.request(url).responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                guard let data = JSON(value).arrayObject as? [[String:Any]] else {
                    return
                }
                completion(AlbumDataResult.Success(data))
            case .failure(let error):
                completion(AlbumDataResult.Failure(error))
            }
        }
    }
    
}
