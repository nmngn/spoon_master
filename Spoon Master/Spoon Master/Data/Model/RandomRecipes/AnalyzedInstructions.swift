//
//  AnalyzedInstructions.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation

struct AnalyzedInstructions : Codable {
    var name : String
    var step : [Step]
}

struct Step : Codable{
    var number : Int
    var step : String
    var ingredient : [Ingredients]
    var equiment : [Equipment]
}

