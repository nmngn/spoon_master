//
//  TableViewCell.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/11/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var nameOfImage: UILabel!
    @IBOutlet private weak var imageOfFood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
