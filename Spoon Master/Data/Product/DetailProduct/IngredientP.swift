//
//  IngredientP.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct IngredientP: Mappable {
    
    var name = ""
    var safetyLevel = ""
    var description = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        safetyLevel <- map["safety_level"]
        description <- map["description"]
    }
}
