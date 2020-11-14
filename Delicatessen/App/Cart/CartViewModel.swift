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
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        cartText?("Mon panier")
        validateTheOrderText?("Valider laa commande")
    }
    
    func didPressValidateTheOrder() {
        
    }
}
