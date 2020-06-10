//
//  ExtendedIngredients.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExtendedIngredient: Mappable {
    
    var aisle: String = ""
    var extenId: Int = 0
    var image: String = ""
    var name: String = ""
    var amount: Int = 0
    var unit: String = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        extenId <- map["id"]
        aisle <- map["aisle"]
        image <- map["image"]
        name <- map["name"]
        amount <- map["amount"]
        unit <- map["unit"]
    }
}
