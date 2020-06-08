//
//  AnalyzedInstructions.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct AnalyzedInstruction : Mappable {
    
    var name : String = ""
    var step : [Step] = []
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        name <- map["analyzedInstructions.name"]
        step <- map["analyzedInstructions.steps"]
    }
    
}

struct Step : Mappable {
    
    var number : Int = 0
    var step : String = ""
    var ingredient : [Ingredient] = []
    var equiment : [Equipment] = []
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        number <- map["analyzedInstructions.steps.number"]
        step <- map["analyzedInstructions.steps.number"]
        ingredient <- map["analyzedInstructions.steps.ingredients"]
        equiment <- map["analyzedInstructions.steps.equipment"]
    }
    

}

