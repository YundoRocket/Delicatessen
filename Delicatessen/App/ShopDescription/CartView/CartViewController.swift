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
    @IBOutlet weak private var validateMyOrderButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
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
        
        viewModel.validateMyOrderText = { [weak self] text in
            DispatchQueue.main.async {
                self?.validateMyOrderButton.setTitle(text,
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
    
    @IBAction func didPressValidateMyOrderButton(_ sender: UIButton) {
        
    }
}
