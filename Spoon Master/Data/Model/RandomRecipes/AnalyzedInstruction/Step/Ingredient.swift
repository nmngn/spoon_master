//
//  Ingredient.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Ingredient: Mappable {
    
    var ingredientId = 0
    var name = ""
    var localizedName = ""
    var image = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        ingredientId <- map["id"]
        name <- map["name"]
        localizedName <- map["localizedName"]
        image <- map["image"]
    }
}
