//
//  Equipment.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Equipment: Mappable {
    
    var equipmentId: Int = 0
    var name: String = ""
    var localizedName: String = ""
    var image: String = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        equipmentId <- map["id"]
        name <- map["name"]
        localizedName <- map["localizedName"]
        image <- map["image"]
    }
}
