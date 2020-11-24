//
//  CartViewController.swift
//  Delicatessen
//
//  Created by Damien Rojo on 14.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class CartViewController: UIViewController {
    
    // MARK: - Private Properties

    private var dataSource = CartDataSource()
    
    // MARK: - Properties

    var viewModel: CartViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet weak private var myCartLabel: UILabel!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var validateOrderButton: UIButton! {
        didSet {
            validateOrderButton.layer.borderWidth = 0.5
            validateOrderButton.layer.cornerRadius = 20
            validateOrderButton.layer.borderColor = #colorLiteral(red: 0, green: 0.3187746108, blue: 0.1371203661, alpha: 1)
        }
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.rowHeight = 67
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    // MARK: - Helpers

    private func bind(to viewModel: CartViewModel) {
        viewModel.myCartText = { [weak self] text in
            DispatchQueue.main.async {
                self?.myCartLabel.text = text
            }
        }

        viewModel.validateOrderText = { [weak self] text in
            DispatchQueue.main.async {
                self?.validateOrderButton.setTitle(text,
                                                     for: .normal)
            }
        }

        viewModel.products = { [weak self] item in
            DispatchQueue.main.async {
                self?.dataSource.update(with: item)
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Actions

    @IBAction func didPressValidateOrderButton(_ sender: UIButton) {
        
    }
}
