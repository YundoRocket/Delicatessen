//
//  CategoriesDataSource.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit


class CategoriesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private
    
    private var items: [Categories] = []
        
    // MARK: - Initializer
    
    init(collectionView: UICollectionView) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCell.nib, forCellWithReuseIdentifier: CategoriesCell.storyboardIdentifier)
    }
    
    func update(with categories: [Categories]) {
        self.items = categories
    }
    
    // MARK: - UICollectionView Methods
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.storyboardIdentifier, for: indexPath) as? CategoriesCell,
              items.indices.contains(indexPath.item) else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.item])
        return cell
    }
    
    
    
}
