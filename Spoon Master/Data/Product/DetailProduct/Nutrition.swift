//
//  Nutrition.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Nutrition: Mappable {
    
    var nutrients: [Nutrient] = []
    var caloricBreakdowns: [CaloricBreakdown] = []
    var calories: Int = 0
    var protein: String = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        nutrients <- map["nutrients"]
        caloricBreakdowns <- map["caloricBreakdown"]
        calories <- map["calories"]
        protein <- map["protein"]
    }
}

struct Nutrient: Mappable {
    
    var title: String = ""
    var amount: Int = 0
    var unit: String = ""
    var percentOfDailyNeeds: Double = 0.0
    
    init?(map: Map) {
           mapping(map: map)
       }
       
       mutating func mapping(map: Map) {
        title <- map["title"]
        amount <- map["amount"]
        unit <- map["unit"]
        percentOfDailyNeeds <- map["percentOfDailyNeeds"]
       }
}

struct CaloricBreakdown: Mappable {
    
    var percentProtein: Double = 0.0
    var percentFat: Double = 0.0
    var percentCarbs: Double = 0.0
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        percentProtein <- map["percentProtein"]
        percentFat <- map["percentFat"]
        percentCarbs <- map["percentCarbs"]
        
    }
}
