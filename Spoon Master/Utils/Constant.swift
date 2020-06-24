//
//  Constant.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/12/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    struct Number {
        static let numberOfRowsInSection = 1
        static let numberOfSection = 3
        static let categoryNumber = 3
        static let collectionNumber = 10
    }
    
    struct Height {
        static let heightOfHeaderInSection: CGFloat = 45
        static let heightForRow: CGFloat = 205
        static let heightForIngredientRow: CGFloat = 115
    }
    
    struct Identifier {
        static let homeTBVCIdentifier = "HomeTableViewCell"
        static let homeCLTVCIdentifier = "HomeCollectionViewCell"
        static let homeHeaderView = "HomeHeaderView"
        static let detailCLTVCIdentifier = "DetailCollectionViewCell"
        static let detailViewController = "DetailViewController"
        static let productViewController = "ProductViewController"
        static let ingredientViewController = "IngredientViewController"
        static let ingredientTableViewCell = "IngredientTableViewCell"
    }
    struct Storyboard {
        static let detail = "Detail"
        static let product = "Product"
        static let ingredient = "Ingredient"
        static let instruction = "Instruction"
        static let favorite = "Favorite"
    }
    
    struct Serial {
        static let sectionOne = 0
        static let sectionTwo = 1
        static let sectionThree = 2
    }
    
    static let popularFoods = "   Popular Foods"
    static let popularRecipes = "   Popular Recipes"
    static let popularProducts = "   Popular Products"
}
