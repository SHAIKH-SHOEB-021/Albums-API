//
//  AlbumsModel.swift
//  Albums API
//
//  Created by shoeb on 11/01/23.
//

import UIKit

class AlbumsModel: NSObject {
    
    var userId : Int?
    var id : Int?
    var title : String?
    
    init(ditionary : [String : Any]) {
        userId = ditionary["userId"] as? Int
        id = ditionary["id"] as? Int
        title = ditionary["title"] as? String
    }
    
}
