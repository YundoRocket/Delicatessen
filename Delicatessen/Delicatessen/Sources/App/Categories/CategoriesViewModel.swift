//
//  CategoriesViewModel.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation
import DLCommons

class CategoriesViewModel {

    // MARK: - Properties
    
    private var _categories: [CategoryViewModel] = [] {
        didSet {
            categories?(_categories)
        }
    }
    
    private var _subCategories: [SubCategoryViewModel] = [] {
        didSet {
            subCategories?(_subCategories)
        }
    }
    init(actions: Actions) {
        self.actions = actions
    }
    let actions: Actions
    
    struct Actions {
        let selectSubcategory: InputClosure<String>
        let onQuit: VoidClosure
    }

    enum Item {
        case category(title: String)
        case subcategory(title: String, imageName: String)
    }


    // MARK: - Inputs

    func viewDidLoad() {
        
        _categories = [
            CategoryViewModel(name: "Produits Maison"),
                       CategoryViewModel(name: "Gateaux et Farines"),
                       CategoryViewModel(name: "BOF"),
                       CategoryViewModel(name: "Consommables"),
                       CategoryViewModel(name: "Boissons et épices")
        ]
        
        _subCategories = [
        SubCategoryViewModel(title: "Hygiène", imageName: "Hygiene"),
        SubCategoryViewModel(title: "Les graines", imageName: "Barley"),
        SubCategoryViewModel(title: "Les biscuits", imageName: "Biscuits"),
        SubCategoryViewModel(title: "Fromage", imageName: "Cheeses"),
        SubCategoryViewModel(title: "Entretien", imageName: "Cleaning"),
        SubCategoryViewModel(title: "Charcuterie fine", imageName: "Delicatessen"),
        SubCategoryViewModel(title: "Les boissons", imageName: "Drink"),
        SubCategoryViewModel(title: "Les oeufs", imageName: "Eggs"),
        SubCategoryViewModel(title: "Les Farines", imageName: "Flour"),
        SubCategoryViewModel(title: "Produits congelés", imageName: "Frozen"),
        SubCategoryViewModel(title: "Les fruits", imageName: "Fruits"),
        SubCategoryViewModel(title: "La viande", imageName: "Meat"),
        SubCategoryViewModel(title: "Lait", imageName: "Milk"),
        SubCategoryViewModel(title: "Animaux", imageName: "Pets"),
        SubCategoryViewModel(title: "Epices", imageName: "Spices"),
        SubCategoryViewModel(title: "Les légumes", imageName: "Vegetables"),
        ]
//        _categories = [
//            Categorie(group: "Produits Maison", title: "Hygiène", image: #imageLiteral(resourceName: "Hygiene")),
//                      Categorie(group: "Gateaux et Farines", title:"Les graines", image: #imageLiteral(resourceName: "Barley.png")),
//                      Categorie(group: "Gateaux et Farines", title: "Les biscuits", image: #imageLiteral(resourceName: "Biscuits")),
//            Categorie(group: "BOF", title: "Fromage", image: #imageLiteral(resourceName: "Cheeses")),
//                      Categorie(group: "Produits Maison", title: "Entretien", image: #imageLiteral(resourceName: "Cleaning")),
//                      Categorie(group: "Consommables", title: "Charcuterie fine", image: #imageLiteral(resourceName: "Delicatessen")),
//                      Categorie(group: "Boissons et épices", title: "Les boissons", image: #imageLiteral(resourceName: "Drink")),
//                      Categorie(group: "BOF", title: "Les oeufs", image: #imageLiteral(resourceName: "Eggs")),
//                      Categorie(group: "Gateaux et Farines", title: "Les farines", image: #imageLiteral(resourceName: "Flour")),
//                      Categorie(group: "Boissons et épices", title: "Produits congelés", image: #imageLiteral(resourceName: "Frozen")),
//                      Categorie(group: "Consommables", title: "Les fruits", image: #imageLiteral(resourceName: "Fruits")),
//                      Categorie(group: "Consommables", title: "La viande", image: #imageLiteral(resourceName: "Meat")),
//                      Categorie(group: "BOF", title: "Lait", image: #imageLiteral(resourceName: "Milk")),
//                      Categorie(group: "Produits Maison", title: "Animaux", image: #imageLiteral(resourceName: "Pets")),
//                      Categorie(group: "Boissons et épices", title: "Epices", image: #imageLiteral(resourceName: "Spices")),
//                      Categorie(group: "Consommables", title: "Les légumes", image: #imageLiteral(resourceName: "Vegetables"))
//        ]
//
    }
    func didSelectCategorie(at index: Int) {
//        guard _categories.indices.contains(index) else { return }
//        let categorie = _categories[index]
//        action.didSelectCategory(categorie)
    }
    
    
    // MARK: - Outputs

    var categories: (([CategoryViewModel]) -> Void)?
    
    var subCategories: (([SubCategoryViewModel]) -> Void)?


}

