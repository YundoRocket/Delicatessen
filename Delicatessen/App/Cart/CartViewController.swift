//
//  CartViewController.swift
//  Delicatessen
//
//  Created by Damien Rojo on 14.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class CartViewController: UIViewController {
    
    // MARK: - Privates Properties
    
    private lazy var dataSource = CartDataSources()
    
    // MARK: - Properties

    var viewModel: CartViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet weak private var myCartLabel: UILabel!
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBOutlet weak private var validateTheOrderButton: UIButton!

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        bint(to: viewModel)
        viewModel.viewDidLoad()
        
    }
    
    // MARK: - Helpers
    
    private func bint(to viewModel: CartViewModel) {
        viewModel.cartText = { [weak self] text in
            DispatchQueue.main.async {
                self?.myCartLabel.text = text
            }
        }
        
        viewModel.validateTheOrderText = { [weak self] text in
            DispatchQueue.main.async {
                self?.validateTheOrderButton.setTitle(text, for: .normal)
            }
        }
        
        viewModel.product = { [weak self] item in
            DispatchQueue.main.async {
                self?.dataSource.update(with: item)
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didPressValidateTheOrderButton(_ sender: UIButton) {
        
    }
}
