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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(UINib(nibName: Constant.homeTBVCIdentifier, bundle: nil), forCellReuseIdentifier: Constant.homeTBVCIdentifier)
            $0.register(UINib(nibName: Constant.homeHeaderView, bundle: nil), forHeaderFooterViewReuseIdentifier: Constant.homeHeaderView)
        }
        repositories.takeRandomRecipesData(number: 10) {_ in
            print("Sucess")
        }
        repositories.takeProductData(query: "protein", number: 10) {_ in
            print("Sucess")
        }
        navigationItem.hidesBackButton = true
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.homeTBVCIdentifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
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
        header.setupName(section: section)
        return header
    }
}
