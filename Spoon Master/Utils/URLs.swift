//
//  URLs.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/12/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation

struct URLs {
    private static var baseUrl = "https://api.spoonacular.com"
    
    static let randomRecipes =
    baseUrl + "/recipes/random"
    
    static let product =
    baseUrl + "/products/search"
    
    static let searchRecipes =
    baseUrl + "/recipes/search"
}
