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
    var recipes: [Recipe] = []
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        recipes <- map["recipes"]
    }
}

struct Recipe: Mappable {
    
    var extendedIngredients: [ExtendedIngredient] = []
    var randomId = 0
    var title = ""
    var readyInMinutes = 0
    var pricePerServing = 0.0
    var image = ""
    var summary = ""
    var instructions = ""
    var analyzedInstructions: [AnalyzedInstruction] = []
    var spoonacularScore = 0
    
    init?(map: Map) {
        mapping(map: map)
    }
    mutating func mapping(map: Map) {
        randomId <- map["id"]
        title <- map["title"]
        readyInMinutes <- map["readyInMinutes"]
        pricePerServing <- map["pricePerServing"]
        image <- map["image"]
        summary <- map["summary"]
        instructions <- map["instructions"]
        spoonacularScore <- map["spoonacularScore"]
        extendedIngredients <- map["extendedIngredient"]
        analyzedInstructions <- map["analyzedInstruction"]
    }
}
