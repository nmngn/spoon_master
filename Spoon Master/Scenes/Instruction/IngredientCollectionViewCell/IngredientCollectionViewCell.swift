//
//  IngredientCollectionViewCell.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/30/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit

final class IngredientCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var ingredientImageView: UIImageView!
    @IBOutlet private weak var ingredientNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupView(_ data: Ingredient) {
        let url = URL(string: data.ingredientImage)
        ingredientNameLabel.do {
            $0.text = data.localizedName
            $0.wrapContent()
        }
        ingredientImageView.kf.setImage(with: url)
    }
}
