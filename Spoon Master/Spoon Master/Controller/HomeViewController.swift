//
//  HomeViewController.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/4/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        takeRandomRecipesData()
        navigationItem.hidesBackButton = true
    }
    func takeRandomRecipesData() {
        let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=e790f127598a49e9b95d1cff09fa4439")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { [unowned self] (data, response, error) in
            if error != nil {
                print("Take Random Recipes Data has fail \(String(describing: error))")
            } else {
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ randomRecipes : Data) {
        guard let json = String(data: randomRecipes, encoding: .utf8),
        let recipes = RandomRecipes(JSONString: json) else {
            print("ERROR")
            return
        }
        print(recipes)
    }
    
}
