//
//  CategoriesDataSource.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit

class CategoriesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    typealias Item = CategoriesViewModel.Item

    private enum VisibleItem {
        case collapsed(title: String)
        case expanded(title: String)
        case indentation(title: String, imageName: String)
    }

    private var items: [VisibleItem] = []

    // MARK: - Properties
    
    var didSelectItemAtIndex: ((Int) -> Void)?
        
    // MARK: - Initializer
    
    init(
        collectionView: UICollectionView,
        viewModel: CategoriesViewModel
    ) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(SubCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: SubCategoriesCollectionViewCell.storyboardIdentifier)
        collectionView.register(CollapsedCategoryCollectionViewCell.self, forCellWithReuseIdentifier: CollapsedCategoryCollectionViewCell.storyboardIdentifier)
        collectionView.register(ExpandedCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ExpandedCategoryCollectionViewCell.storyboardIdentifier)
    }
    
    func update(with items: [Item]) {
        self.items = items.enumerated().map {
            switch $0.element {
            case .category(title: let title):
                if case .subcategory = items[$0.offset + 1] {
                    return .expanded(title: title)
                }
                return .collapsed(title: title)
            case .subcategory(title: let title, imageName: let imageName):
                return .indentation(title: title, imageName: imageName)
            }
        }
    }
    
    // MARK: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard items.indices.contains(indexPath.item) else { fatalError() }
        switch items[indexPath.item] {
        case .collapsed(title: let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollapsedCategoryCollectionViewCell.storyboardIdentifier, for: indexPath) as! CollapsedCategoryCollectionViewCell
            cell.configure(with: .init(name: title))
            return cell
        case .expanded(title: let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpandedCategoryCollectionViewCell.storyboardIdentifier, for: indexPath) as! ExpandedCategoryCollectionViewCell
            cell.configure(with: .init(name: title))
            return cell
        case .indentation(title: let title, imageName: let imageName):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCategoriesCollectionViewCell.storyboardIdentifier, for: indexPath) as! SubCategoriesCollectionViewCell
            cell.configure(with: .init(title: title, imageName: imageName))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        guard indexPath.item < items.count else {
            fatalError()
        }
        didSelectItemAtIndex?(index)
    }
}

