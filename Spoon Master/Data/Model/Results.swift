//
//  Results.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/15/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Results: Mappable {
    var recipesId = 0
    var readyInMinute = 0
    var serving = 0
    var sourceUrl = ""
    var image = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        recipesId <- map["id"]
        readyInMinute <- map["readyInMinutes"]
        serving <- map["servings"]
        sourceUrl <- map["sourceUrl"]
        image <- map["image"]
    }
}
