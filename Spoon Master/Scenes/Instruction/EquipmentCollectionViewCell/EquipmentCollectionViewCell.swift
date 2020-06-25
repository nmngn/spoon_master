//
//  EquipmentCollectionViewCell.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/30/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import Kingfisher

final class EquipmentCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var equipmentImageView: UIImageView!
    @IBOutlet private weak var equipmentLabel: UILabel!
    
    func setupView( _ data: Equipment) {
        let url = URL(string: data.equipmentImage)
        equipmentLabel.do {
            $0.text = data.localizedName
            $0.wrapContent()
        }
        equipmentImageView.kf.setImage(with: url)
    }
}
