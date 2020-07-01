//
//  InstructionTableViewCell.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/25/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import Kingfisher
import Then

final class InstructionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var contentLabel: UITextView!
    @IBOutlet weak var ingredientCollectionView: UICollectionView!
    @IBOutlet weak var equipmentCollectionView: UICollectionView!
    
    private var data: Step?
    private var check: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    func takeInstructionData( _ data: Step) {
        numberLabel.text = "Step \(data.number)"
        contentLabel.text = data.step
        contentLabel.isEditable = false
        self.data = data
    }
    
    func configView() {
        ingredientCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(UINib(nibName: Constant.Identifier.ingredientCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier.ingredientCollectionViewCell)
        }
        equipmentCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(UINib(nibName: Constant.Identifier.equipmentCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier.equipmentCollectionViewCell)
        }
    }
    
}
// MARK: - UICollectionViewDelegate Datasource
extension InstructionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ingredientCollectionView {
            return data?.ingredients.count ?? 0
        } else if collectionView == equipmentCollectionView {
            return data?.equiments.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ingredientCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.ingredientCollectionViewCell, for: indexPath) as?
                IngredientCollectionViewCell,
                let newData = data else {
                    return UICollectionViewCell()
            }
            cell.setupView(newData.ingredients[indexPath.item])
            return cell
            
        } else if collectionView == self.equipmentCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.equipmentCollectionViewCell, for: indexPath) as?
                EquipmentCollectionViewCell,
                let newData = data else {
                    return UICollectionViewCell()
            }
            cell.setupView(newData.equiments[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
}
