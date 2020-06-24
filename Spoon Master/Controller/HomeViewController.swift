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
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let repositories = Repositories(api: .share)
    
    private var popularFoods: [DataCell] = []
    private var popularRecipes: [DataCell] = []
    private var popularProducts: [DataCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(UINib(nibName: Constant.Identifier.homeTBVCIdentifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier.homeTBVCIdentifier)
            $0.register(UINib(nibName: Constant.Identifier.homeHeaderView, bundle: nil), forHeaderFooterViewReuseIdentifier: Constant.Identifier.homeHeaderView)
        }
        configHomeData()
        navigationItem.hidesBackButton = true
    }
// MARK: - Configdata & Fetch
    private func configHomeData() {
        repositories.takeRandomRecipesData(number: 20) { [weak self] (results) in
            DispatchQueue.main.async {
                self?.fetchRecipesData(results)
            }
        }
        repositories.takeProductData(query: "protein", number: 10) { [weak self] (results) in
            DispatchQueue.main.async {
                self?.fetchProductData(results)
            }
        }
    }
    
    private func fetchRecipesData( _ results: BaseResult<RandomRecipes>) {
        switch results {
        case .success(let data):
            guard let recipeData = data?.recipes.map({
                DataCell.recipesCell($0)
            }) else { return }
            for (index, value) in recipeData.enumerated() {
                if index % 2 == 0 {
                    popularFoods.append(value)
                } else {
                    popularRecipes.append(value)
                }
            }
            tableView.reloadData()
        case .failure:
            print("Random Recipes has error")
        }
    }
    
    private func fetchProductData( _ results: BaseResult<Product>) {
        switch results {
        case .success(let data):
            let productData = data?.products.map {
                DataCell.productsCell($0)
            }
            popularProducts += productData ?? []
            tableView.reloadData()
        case .failure:
            print("Products has error")
        }
    }
}

// MARK: - UITableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.Height.heightForRow
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.Number.numberOfRowsInSection
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.Identifier.homeTBVCIdentifier,
            for: indexPath) as? HomeTableViewCell
            else { return UITableViewCell() }
        cell.delegate = self
        
        switch indexPath.section {
        case 0:
            cell.configData(popularFoods, type: Constant.Serial.zero)
        case 1:
            cell.configData(popularRecipes, type: Constant.Serial.one)
        default:
            cell.configData(popularProducts, type: Constant.Serial.two)
        }
        return cell
    }
    
    // MARK: - Custom TableView Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.Number.numberOfSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.Height.heightOfHeaderInSection
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: Constant.Identifier.homeHeaderView) as? HomeHeaderView else {
            return UIView()
        }
        switch section {
        case 0:
            header.setupName(sectionTitle: Constant.popularFoods)
        case 1:
            header.setupName(sectionTitle: Constant.popularRecipes)
        default:
            header.setupName(sectionTitle: Constant.popularProducts)
        }
        return header
    }
}

// MARK: - HomeDelegate
extension HomeViewController: HomeDelegate {
    func changeRecipesScreen(_ recipe: DataCell) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: Constant.Identifier.detailViewController) as? DetailViewController {
            navigationController?.pushViewController(detailVC, animated: true)
            switch recipe {
            case .recipesCell(let value):
                detailVC.takeData(value)
            case .productsCell(_ ):
                break
            }
        }
    }
    
    func changeProductScreen(_ product: DataCell) {
        let productVC = UIStoryboard(name: "Product", bundle: nil).instantiateViewController(withIdentifier: Constant.Identifier.productViewController)
        navigationController?.pushViewController(productVC, animated: true)
    }
}
