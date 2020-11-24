//
//  CategoriesViewController.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit

final class CategoriesViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK - Properties
    
    var viewModel: CategoriesViewModel!
    private lazy var dataSource = CategoriesDataSource(collectionView: collectionView,
                                                       viewModel: viewModel)
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
        
    }
    
    private func bind(to viewModel: CategoriesViewModel) {
        viewModel.heading = { [weak self] items in
            DispatchQueue.main.async {
                self?.dataSource.update(with: items)
                self?.collectionView.reloadData()
            }
        }
    }
    private func bind(to dataSource: CategoriesDataSource) {
        dataSource.didSelectItemAtIndex = viewModel.didSelectCategorie
    }
    
    // MARK: - Helper Methods
    
}
