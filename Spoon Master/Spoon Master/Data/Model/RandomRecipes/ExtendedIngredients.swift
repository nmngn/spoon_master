//
//  ExtendedIngredients.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExtendedIngredients : Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        aisle <- map["extendedIngredient.aisle"]
        image <- map["extendedIngredient.image"]
        name <- map["extendedIngredient.name"]
        amount <- map["extendedIngredient.amount"]
        unit <- map["extendedIngredient.unit"]
    }
    
    var aisle : String
    var id : Int
    var image : String
    var name : String
    var amount : Int
    var unit : String
}
