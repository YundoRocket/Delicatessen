//
//  CategoriesCell.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit
import DLCommons

class SubCategoriesCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    private let categorieImage = UIImageView()

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
        contentView.addSubview(categorieImage)
        categorieImage.makeLayout {
            $0.fillSuperview(
                with: .init(
                    top: 8,
                    left: 8,
                    bottom: 8,
                    right: 8
                )
            )
        }
    }

    // MARK: - Configure

    func configure(with viewModel: SubCategoryViewModel) {
        categorieImage.image = UIImage(named: viewModel.imageName)
    }
}
