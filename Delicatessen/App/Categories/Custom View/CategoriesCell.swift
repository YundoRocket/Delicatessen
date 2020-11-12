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
    @IBOutlet weak var title: UILabel!
    
    // MARK: - View Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.categorie = nil
        self.title = nil
    }
    
    // MARK: - Configure
    
    func configure(with categorie: Categories) {
        self.categorie.image = UIImage(named: categorie.image)
        self.title.text = categorie.title
    }
}
