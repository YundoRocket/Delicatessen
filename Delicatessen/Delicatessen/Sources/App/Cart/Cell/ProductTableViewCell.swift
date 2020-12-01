//
//  ProductTableViewCell.swift
//  Delicatessen
//
//  Created by Bertrand BLOC'H on 01/12/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit
import DLCommons

final class ProductTableViewCell: UITableViewCell {

    private let container = UIStackView(
        axis: .horizontal,
        spacing: 8
    )
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private let priceLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        container.addArrangedSubviews([nameLabel, priceLabel])
        contentView.addSubview(container)
        container.makeLayout {
            $0.fillSuperview(
                with: .init(
                    top: 8,
                    left: 8,
                    bottom: 8,
                    right: 8
                ),
                relativeToSafeArea: false
            )
        }
    }

    // MARK: - Configure

    func configure(with viewModel: ProductViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
    }
}
