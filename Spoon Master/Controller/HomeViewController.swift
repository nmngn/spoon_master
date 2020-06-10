//
//  HomeViewController.swift
//  Spoon Master
//
//  Created by Nam Ngây on 6/4/20.
//  Copyright © 2020 Nam Ngây. All rights reserved.
//

import UIKit
import ObjectMapper
import Then

final class HomeViewController: UIViewController {
    
    var randomRecipes = [RandomRecipes]()
    let repositories = Repositories()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        }
        repositories.takeRandomRecipesData {
            print($0)
        }
        repositories.takeProductData {
            print($0)
        }
        navigationItem.hidesBackButton = true
    }
    
}

// MARK: - UITableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { print("ERROR")
            return UITableViewCell() }
        setupCell(indexPath, cell)
        return cell
    }
    
    func setupCell( _ data: IndexPath, _ cell: HomeTableViewCell) {
        switch data.row {
        case 0 :
            cell.categoryTitle.text = " Popular Foods"
        case 1 :
            cell.categoryTitle.text = " Popular Recipes"
        default :
            cell.categoryTitle.text = " Popular Products"
        }
    }
}
