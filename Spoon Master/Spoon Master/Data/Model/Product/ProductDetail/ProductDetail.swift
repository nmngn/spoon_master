//
//  ProductDetail.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation

struct ProductDetail : Codable {
    var id : Int
    var title : String
    var price : Double
    var nutrition : [Nutrition]
    var serving_size : String
    var description : String
    var upc : String
    var ingredients : [IngredientP]
    var ingredientCount : Int
    var ingredientList : String
    var image : [String]
}
