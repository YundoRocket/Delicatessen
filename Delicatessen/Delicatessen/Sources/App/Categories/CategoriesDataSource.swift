//
//  CategoriesDataSource.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit

class CategoriesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private var items: [Categorie] = []
    var didSelectItemAtIndex: ((Int) -> Void)?
        
    // MARK: - Initializer
    
    init(collectionView: UICollectionView, viewModel: CategoriesViewModel) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCell.nib, forCellWithReuseIdentifier: CategoriesCell.storyboardIdentifier)
    }
    
    func update(with categories: [Categorie]) {
        self.items = categories
    }
    
    // MARK: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard items.indices.contains(indexPath.item) else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.storyboardIdentifier,
                                                      for: indexPath) as! CategoriesCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        guard indexPath.item < items.count else {
            fatalError()
        }
        didSelectItemAtIndex?(index)
        print(index)
    }
}

//extension CategoriesDataSource: CategoriesCollectionViewLayoutDelegate {
//    
//  func collectionView(_ collectionView: UICollectionView,
//                      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat { return items[indexPath.item].image.size.height
//    }
//}
