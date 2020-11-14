//
//  CartViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 14.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

final class CartViewModel {
    
    // MARK: - Outputs
    
    var cartText: InputClosure<String>?
    var validateTheOrderText: InputClosure<String>?
    var product: InputClosure<[Product]>?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        cartText?("Mon panier")
        validateTheOrderText?("Valider la commande")
        product?([Product(categoryImage: "Barley", name: "Spaghetti", quantity: "500gr"),
                  Product(categoryImage: "Fruits", name: "Pomme", quantity: "1kg"),
                  Product(categoryImage: "Cheeses", name: "Comté", quantity: "500gr")])
    }
    
    func didPressValidateTheOrder() {
        
    }
}
