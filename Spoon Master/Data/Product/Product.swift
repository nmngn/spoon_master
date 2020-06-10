//
//  Product.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/5/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import ObjectMapper

struct Product: Mappable {
  
    var products: [Item] = []
    var totalProducts: Int = 0
    
    init?(map: Map) {
          mapping(map: map)
      }
      
      mutating func mapping(map: Map) {
          products <- map["products"]
        totalProducts <- map["totalProducts"]
      }
}

struct Item: Mappable {
    var itemId: Int = 0
    var title: String = ""
    var image: String = ""
    var imageType: String = ""
    
    init?(map: Map) {
          mapping(map: map)
      }
      
      mutating func mapping(map: Map) {
        itemId <- map["id"]
        title <- map["title"]
        image <- map["image"]
        imageType <- map["imageType"]
      }
}
