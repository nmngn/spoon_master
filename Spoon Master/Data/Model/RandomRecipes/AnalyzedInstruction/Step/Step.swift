//
//  File.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/9/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Step : Mappable {
    
    var number : Int = 0
    var step : String = ""
    var ingredients : [Ingredient] = []
    var equiments : [Equipment] = []
    var lengths : [Length] = []
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        number <- map["number"]
        step <- map["step"]
        ingredients <- map["ingredients"]
        equiments <- map["equipment"]
        lengths <- map["length"]
    }
}

struct Length : Mappable {
    
    var number : Int = 0
    var unit : String = ""
    init?(map: Map) {
        mapping(map : map)
    }
    
    mutating func mapping(map: Map) {
        number <- map["number"]
        unit <- map["unit"]
    }
}
