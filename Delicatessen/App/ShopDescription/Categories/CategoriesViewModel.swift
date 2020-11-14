//
//  CategoriesViewModel.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation

final class CategoriesViewModel {

    private var _categories: [Categories] = []

    // MARK: - Properties


    // MARK: - Initializer

    // MARK: - Outputs

    var categories: (([Categories]) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        categories?([Categories(title: "Barley", image: "Barley")])
//        [Categories(title: "Barley", image: #imageLiteral(resourceName: "Barley.png")),
//        Categories(title: "Biscuits", image: #imageLiteral(resourceName: "Biscuits")),
//        Categories(title: "Cheeses", image: #imageLiteral(resourceName: "Cheeses")),
//        Categories(title: "Cleaning", image: #imageLiteral(resourceName: "Cleaning")),
//        Categories(title: "Delicatessen", image: #imageLiteral(resourceName: "Delicatessen")),
//        Categories(title: "Drink", image: #imageLiteral(resourceName: "Drink")),
//        Categories(title: "Eggs", image: #imageLiteral(resourceName: "Eggs")),
//        Categories(title: "Flour", image: #imageLiteral(resourceName: "Flour")),
//        Categories(title: "Frozen", image: #imageLiteral(resourceName: "Frozen")),
//        Categories(title: "Fruits", image: #imageLiteral(resourceName: "Fruits")),
//        Categories(title: "Hygiene", image: #imageLiteral(resourceName: "Hygiene")),
//        Categories(title: "Meat", image: #imageLiteral(resourceName: "Meat")),
//        Categories(title: "Milk", image: #imageLiteral(resourceName: "Milk")),
//        Categories(title: "Pets", image: #imageLiteral(resourceName: "Pets")),
//        Categories(title: "Spices", image: #imageLiteral(resourceName: "Spices")),
//        Categories(title: "Vegetables", image: #imageLiteral(resourceName: "Vegetables"))]
    }

}

