//
//  CollectionViewCell.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/11/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import Kingfisher
import Then

enum DataCell {
    case recipesCell(Recipe)
    case productsCell(Item)
}

final class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var foodImageView: UIImageView!
    @IBOutlet private weak var foodNameLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    func configCell() {
        foodImageView.layer.do {
            $0.cornerRadius = $0.frame.height / 10.0
            $0.masksToBounds = true
            $0.shadowColor = UIColor.black.cgColor
            $0.shadowOpacity = 1
            $0.shadowOffset = CGSize.zero
            $0.shadowRadius = 10
        }
    }
    
    func configDataCell( _ data: DataCell) {
        switch data {
        case .productsCell(let item):
            foodNameLabel.text = "   \(item.title)"
            let url = URL(string: item.image)
            foodImageView.kf.setImage(with: url)
        case .recipesCell(let recipe):
            foodNameLabel.text = "   \(recipe.title)"
            let url = URL(string: recipe.image)
            foodImageView.kf.setImage(with: url)
        }
    }
}
