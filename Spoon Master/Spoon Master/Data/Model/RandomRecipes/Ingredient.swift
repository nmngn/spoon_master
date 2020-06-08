//
//  Ingredient.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Ingredient : Mappable {
   
    var id : Int = 0
    var name : String = ""
    var localizedName : String = ""
    var image : String = ""
    
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id <- map["analyzedInstructions.steps.ingredients.id"]
        name <- map["analyzedInstructions.steps.ingredients.name"]
        localizedName <- map["analyzedInstructions.steps.ingredients.localizedName"]
        image <- map["analyzedInstructions.steps.ingredients.image"]
    }
}
