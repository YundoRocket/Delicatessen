//
//  GroupCollectionReusableView.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit
import DLCommons

class GroupCollectionReusableView: UICollectionReusableView {

    private let container = UIStackView(
        axis: .horizontal,
        spacing: 25
    )
    private let title = UILabel()
    private let showMore = UIButton()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        container.addArrangedSubviews([title, showMore])
        addSubview(container)
        container.makeLayout {
            $0.fillSuperview()
        }
    }
    
    func configure(with viewModel: CategoriesViewModel) {
        //title.text = viewModel.categories
    }
}
