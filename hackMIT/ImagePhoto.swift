//
//  ImagePhoto.swift
//  hackMIT
//
//  Created by Hannah Chen on 9/16/17.
//  Copyright © 2017 Hannah Chen. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserObject {
    var pictureURL: String!
    var username: String!
    
    required init(json: JSON) {
        pictureURL = json["picture"]["medium"].stringValue
        username = json["email"].stringValue
    }
}

