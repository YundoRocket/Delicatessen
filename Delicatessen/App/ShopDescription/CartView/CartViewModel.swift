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
    
    var myCartText: InputClosure<String>?
    var validateMyOrderText: InputClosure<String>?
    var products: InputClosure<[Product]>?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        myCartText?("Mon panier")
        validateMyOrderText?("Valider la commande")
        products?([Product(categoryImage: "Cheeses", name: "Roquefort", quantity: "300gr"), Product(categoryImage: "Delicatessen", name: "Jambon crue", quantity: "200gr"), Product(categoryImage: "Meat", name: "Steack", quantity: "600gr")])
    }
}