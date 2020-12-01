//
//  CartDataSource.swift
//  Delicatessen
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class CartViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    typealias Item = CartViewModel.Item

    // MARK: - Properties

    private var items: [Item] = []

    // MARK: - Initializer

    init(tableView: UITableView) {
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.storyboardIdentifier)
    }

    // MARK: - Public

    func update(items: [Item]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard items.indices.contains(indexPath.item) else {
            fatalError()
        }
        switch items[indexPath.item] {
        case .product(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.storyboardIdentifier, for: indexPath) as! ProductTableViewCell
            cell.configure(with: viewModel)
            return cell
        }
    }
}
