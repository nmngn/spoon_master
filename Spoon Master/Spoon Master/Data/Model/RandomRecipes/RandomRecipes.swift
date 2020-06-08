//
//  RandomRecipes.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct RandomRecipes: Mappable {
    var recipes : [Recipe] = []
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        recipes <- map["recipes"]
    }
}
    
   
struct Recipe : Mappable {
    
    var extendedIngredients : [ExtendedIngredients] = []
    var id : Int = 0
    var title : String = ""
    var readyInMinutes :Int = 0
    var sourceUrl : String = ""
    var image : String = ""
    var summary : String = ""
    var instructions : String = ""
    var analyzedInstructions : [AnalyzedInstructions] = []
    var spoonacularSourceUrl : String = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        readyInMinutes <- map["readyInMinutes"]
        sourceUrl <- map["sourceUrl"]
        image <- map["image"]
        summary <- map["summary"]
        instructions <- map["instructions"]
        spoonacularSourceUrl <- map["spoonacularSourceUrl"]
        extendedIngredients <- map["ExtendedIngredients"]
        analyzedInstructions <- map["AnalyzedInstruction"]
    }
}

