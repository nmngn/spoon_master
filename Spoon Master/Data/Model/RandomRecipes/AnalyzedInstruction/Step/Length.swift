//
//  Length.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/17/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Length: Mappable {
    
    var number = 0
    var unit = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        number <- map["number"]
        unit <- map["unit"]
    }
}
