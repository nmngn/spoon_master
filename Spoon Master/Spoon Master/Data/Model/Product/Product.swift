//
//  Product.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation

struct Product : Codable {
    var products : [Item]
    var totalProducts : Int
}

struct Item : Codable {
    var id : Int
    var title : String
    var image : String
}
