//
//  HomeHeaderView.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/16/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit

final class HomeHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var category: UILabel!
    
    func setupName(section: Int) {
        switch section {
        case 0 :
            category.text = Constant.popularFoods
        case 1 :
            category.text = Constant.popularRecipes
        default :
            category.text = Constant.popularProducts
        }
    }
}
