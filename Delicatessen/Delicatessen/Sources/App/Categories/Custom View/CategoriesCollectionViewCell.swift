//
//  CategoriesCell.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit
import DLCommons

class CategoriesCollectionViewCell: UICollectionViewCell {
 
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //self.categorie = nil
    }
    
    
    private func setupUI() {
        addSubview(categorieImage)
        categorieImage.makeLayout {
            $0.height == 65
            $0.width == 65
        }
    }
    // MARK: - Configure
    
    func configure(with categorie: Categorie) {
        categorieImage.image = categorie.image
    }
}
