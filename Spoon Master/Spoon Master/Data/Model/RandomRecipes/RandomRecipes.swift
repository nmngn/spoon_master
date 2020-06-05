//
//  RandomRecipes.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation

struct RandomRecipes : Codable {
    var recipes : [Recipes]
}

struct Recipes : Codable {
    var extendedIngredients : [ExtendedIngredients]
    var id : Int
    var title : String
    var readyInMinutes :Int
    var sourceUrl : String
    var image : String
    var summary : String
    var instructions : String
    var analyzedInstructions : [AnalyzedInstructions]
    var spoonacularSourceUrl : String
}
