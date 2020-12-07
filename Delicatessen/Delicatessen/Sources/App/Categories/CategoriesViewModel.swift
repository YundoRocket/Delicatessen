//
//  CategoriesViewModel.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation
import DLCommons

final class CategoriesViewModel {

    // MARK: - Properties

    private var productItems: [ProductItem] = [] {
        didSet {
            let items = productItems.map { Item(productItem: $0) }
            self.items?(items)
        }
    }

    private let actions: Actions
    struct Actions {
        let selectSubcategory: InputClosure<String>
        let onQuit: VoidClosure
    }

    enum Item {
        case category(title: String)
        case subcategory(title: String, imageName: String)
    }

    enum ProductItem {
        case category(category: CategoryResponse.Category)
        case subCategory(subCategory: CategoryResponse.Category.SubCategory)
    }

    private let repository: CategoriesRepositoryType

    // MARK: - Init

    init(actions: Actions, repository: CategoriesRepositoryType) {
        self.actions = actions
        self.repository = repository
    }

    // MARK: - Outputs

    var items: InputClosure<[Item]>?

    // MARK: - Inputs

    func viewDidLoad() {
        repository.requestCategories { [weak self] result in
            switch result {
            case .success(let response):
                self?.productItems = CategoriesViewModel.initialize(from: response)
            case .failure(let error):
                print(error)
            }
        }
    }

    private class func initialize(from response: CategoryResponse) -> [ProductItem] {
        return [.category(category: response.categories.first!)]
    }

    func didSelectCategorie(at index: Int) {

    }
}

extension CategoriesViewModel.Item {
    init(productItem: CategoriesViewModel.ProductItem) {
        switch productItem {
        case .category(category: let category):
            self = .category(title: category.name.fr)
        case .subCategory(subCategory: let subCategory):
            self = .subcategory(title: subCategory.name.fr, imageName: subCategory.image)
        }
    }
}
