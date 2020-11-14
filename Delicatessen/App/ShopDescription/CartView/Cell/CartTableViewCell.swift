//
//  CartTableViewCell.swift
//  Delicatessen
//
//  Created by Damien Rojo on 14.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class CartTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var categoryImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var quantityLabel: UILabel!
    
    // MARK: - Actions
    
    func configure(with product: Product) {
        categoryImageView.image = UIImage(named: product.categoryImage)
        nameLabel.text = product.name
        quantityLabel.text = product.quantity
    }
}
