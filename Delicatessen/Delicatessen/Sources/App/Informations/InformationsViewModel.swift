//
//  ShopDescriptionViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

final class InformationsViewModel {
    
    // MARK: - Privates Properties
    
    private let actions: Actions
    
    struct Actions {
        let didPresentShopDescription: VoidClosure
    }
    
    enum InformationsConfiguration {
        case shopDescription, validateOrder
    }
    
    // MARK: - Outputs
    
    var configuration: InputClosure<InformationsConfiguration>?
    
    // MARK: - Init

    init(
        actions: Actions
    ) {
        self.actions = actions
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        
    }
    
    // MARK: - Helpers
    
    func didPressPhoneNumber() {
        
    }
    
    func didPressPlaceAnOrder() {
        actions.didPresentShopDescription()
    }
    
    func didPressConfirm() {
        
    }
}
