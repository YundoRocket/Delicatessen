//
//  CategoriesViewController.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit
import DLCommons

final class CategoriesViewController: UIViewController {
    
    // MARK - Properties
    
    var viewModel: CategoriesViewModel!
    
    private var collectionView = UICollectionView()
    private lazy var dataSource = CategoriesDataSource(collectionView: collectionView,
                                                       viewModel: viewModel)
    
    // MARK: - Initializer
    
    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        //viewModel.viewDidLoad()
        
    }
    
    private func bind(to viewModel: CategoriesViewModel) {
        viewModel.categories = { [weak self] items in
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
    
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.makeLayout {
            $0.fillSuperview()
        }
    }
    
}
