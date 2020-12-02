//
//  ExpandedCategoryCollectionViewCell.swift
//  Delicatessen
//
//  Created by Bertrand BLOC'H on 02/12/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class ExpandedCategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    private let container = UIStackView(
        alignment: .center,
        axis: .horizontal,
        spacing: 8
    )
    private let titleLabel = UILabel()
    private let expandedImage = UIImageView()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle

    private func setupUI() {
        container.addArrangedSubviews([titleLabel, expandedImage])
        contentView.addSubview(container)
        container.makeLayout {
            $0.fillSuperview()
        }
    }

    // MARK: - Configure

    func configure(with viewModel: CategoryViewModel) {
        titleLabel.text = viewModel.name
        expandedImage.image = UIImage(named: "")
    }
}
