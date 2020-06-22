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
            $0.register(UINib(nibName: Constant.homeTBVCIdentifier, bundle: nil), forCellReuseIdentifier: Constant.homeTBVCIdentifier)
            $0.register(UINib(nibName: Constant.homeHeaderView, bundle: nil), forHeaderFooterViewReuseIdentifier: Constant.homeHeaderView)
        }
        configHomeData()
        navigationItem.hidesBackButton = true
    }
    
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
        return Constant.heightForRow
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.numberOfRowsInSection
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.homeTBVCIdentifier,
            for: indexPath) as? HomeTableViewCell
            else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            cell.configData(popularFoods)
        case 1:
            cell.configData(popularRecipes)
        default:
            cell.configData(popularProducts)
        }
        return cell
    }
    
    // MARK: - Custom TableView Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.numberOfSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.heightOfHeaderInSection
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: Constant.homeHeaderView) as? HomeHeaderView else {
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
