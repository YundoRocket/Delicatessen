//
//  CategoriesCell.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit

class CategoriesCell: UICollectionViewCell {
 
    
    // MARK: - Outlets
    
    @IBOutlet weak var categorie: UIImageView!

    // MARK: - View Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.categorie = nil
    }
    
    // MARK: - Configure
    
    func configure(with categorie: Categorie) {
        self.categorie.image = categorie.image
    }
}
