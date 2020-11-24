//
//  CategoriesViewModel.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation

final class CategoriesViewModel {

    // MARK: - Properties
    
    private var categories: [Categorie] = [] {
        didSet {
            heading?(categories)
        }
    }
    
    private let action: Actions
    
    struct Actions {
        
        let didSelectCategory: (Categorie) -> Void
        
    }
    
    // MARK: - Initializer

    init(action: Actions) {
        
        self.action = action
        
    }

    // MARK: - Outputs

    var heading: InputClosure<[Categorie]>?

    // MARK: - Inputs

    func viewDidLoad() {
        categories = [Categorie(image: #imageLiteral(resourceName: "Hygiene")),
            Categorie(image: #imageLiteral(resourceName: "Barley.png")),
            Categorie(image: #imageLiteral(resourceName: "Biscuits")),
            Categorie(image: #imageLiteral(resourceName: "Cheeses")),
            Categorie(image: #imageLiteral(resourceName: "Cleaning")),
            Categorie(image: #imageLiteral(resourceName: "Delicatessen")),
            Categorie(image: #imageLiteral(resourceName: "Drink")),
            Categorie(image: #imageLiteral(resourceName: "Eggs")),
            Categorie(image: #imageLiteral(resourceName: "Flour")),
            Categorie(image: #imageLiteral(resourceName: "Frozen")),
            Categorie(image: #imageLiteral(resourceName: "Fruits")),
            Categorie(image: #imageLiteral(resourceName: "Meat")),
            Categorie(image: #imageLiteral(resourceName: "Milk")),
            Categorie(image: #imageLiteral(resourceName: "Pets")),
            Categorie(image: #imageLiteral(resourceName: "Spices")),
            Categorie(image: #imageLiteral(resourceName: "Vegetables"))]
    }
    func didSelectCategorie(at index: Int) {
        guard categories.indices.contains(index) else { return }
        let categorie = categories[index]
        action.didSelectCategory(categorie)
    }
}

