//
//  TableViewCell.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/11/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import Then

final class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var data = [DataCell]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    func configCell() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(UINib(nibName: Constant.homeCLTVCIdentifier, bundle: nil),
                        forCellWithReuseIdentifier: Constant.homeCLTVCIdentifier)
        }
    }
    
    func configData(_ data: [DataCell]) {
        self.data = data
    }
}

// MARK: - UICollectionView Dalegate
extension HomeTableViewCell: UICollectionViewDelegate {
}

// MARK: - UICollectionView DataSource
extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.homeCLTVCIdentifier, for: indexPath) as? HomeCollectionViewCell
            else {
                return UICollectionViewCell()
        }
        cell.configDataCell(data[indexPath.row])
        return cell
    }
}
