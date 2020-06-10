//
//  UserRepositories.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/12/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import Alamofire

struct Repositories {
    
    // MARK: - Take Recipes Data
    func takeRandomRecipesData( completion:@escaping (Any) -> Void) {
        let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=e790f127598a49e9b95d1cff09fa4439")
        let request = Alamofire.request(url!)
        request.responseJSON { (response) in
            completion(response)
        }
    }
    
    // MARK: - Take Product Data
    
    func takeProductData(completion: @escaping(Any) -> Void) {
        let url = URL(string: "https://api.spoonacular.com/food/products/search?query=protein&apiKey=e790f127598a49e9b95d1cff09fa4439")
        let request = Alamofire.request(url!)
        request.responseJSON { (response) in
            completion(response)
        }
    }
}
