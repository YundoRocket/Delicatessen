//
//  CategoriesViewModel.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation
import DLCommons

struct CategoriesViewModel {

    // MARK: - Properties
    
    let actions: Actions
    struct Actions {
        let selectSubcategory: InputClosure<String>
        let onQuit: VoidClosure
    }

    enum Item {
        case category(title: String)
        case subcategory(title: String, imageName: String)
    }


    // MARK: - Outputs



    // MARK: - Inputs

    func viewDidLoad() {
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
        
    }
    func didSelectCategorie(at index: Int) {
//        guard _categories.indices.contains(index) else { return }
//        let categorie = _categories[index]
//        action.didSelectCategory(categorie)
    }
}

