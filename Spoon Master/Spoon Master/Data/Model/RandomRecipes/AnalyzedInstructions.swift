//
//  AnalyzedInstructions.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct AnalyzedInstructions : Mappable {
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        step <- map["Step"]
    }
    
    var name : String
    var step : [Step]
}

struct Step : Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        
    }
    
    
    var number : Int
    var step : String
    var ingredient : [Ingredients]
    var equiment : [Equipment]
}

