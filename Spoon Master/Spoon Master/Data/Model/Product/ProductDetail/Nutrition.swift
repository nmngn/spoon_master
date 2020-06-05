//
//  Nutrition.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation

struct Nutrition : Codable {
    var nutrients : [Nutrients]
    var caloricBreakdown : [CaloricBreakdown]
    var calories : Int
    var protein : String
}

struct Nutrients : Codable {
    var title : String
    var amount : Int
    var unit : String
    var percentOfDailyNeeds : Double
}

struct CaloricBreakdown : Codable {
    var percentProtein : Double
    var percentFat : Double
    var percentCarbs : Double
}
