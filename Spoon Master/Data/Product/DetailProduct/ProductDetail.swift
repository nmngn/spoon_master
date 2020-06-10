//
//  ProductDetail.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct ProductDetail : Mappable {
    
    var id : Int = 0
    var title : String = ""
    var price : Double = 0.0
    var nutritions : [Nutrition] = []
    var servingSize : String = ""
    var description : String = ""
    var upc : String = ""
    var ingredients : [IngredientP] = []
    var ingredientCount : Int = 0
    var ingredientList : String = ""
    var image : [String] = []
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        price <- map["price"]
        nutritions <- map["nutrition"]
        servingSize <- map["serving_size"]
        description <- map["description"]
        upc <- map["upc"]
        ingredients <- map["ingredients"]
        ingredientCount <- map["ingredientCount"]
        ingredientList <- map["ingredientList"]
        image <- map["image"]
    }
}
