//
//  ShopDescriptionViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation
import DLCommons

final class InformationsViewModel {
    
    // MARK: - Privates Properties
    
    private let actions: Actions
    
    struct Actions {
        let didPresentAlert: (AlertConfiguration) -> Void
        let didPresentPlaceAnOrder: VoidClosure
    }
    
    private var currentConfiguration: InformationsConfiguration = .shopDescription {
        didSet {
            configuration?(currentConfiguration)
        }
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
        DispatchQueue.main.async {
            self.actions.didPresentAlert(AlertConfiguration(title: "Attention",
                                                            message: "",
                                                            okMessage: "ok",
                                                            cancelMessage: ""))
            self.currentConfiguration = .shopDescription
        }
    }
    
    // MARK: - Helpers
    
    func didPressPhoneNumber() {
        
    }
    
    func didPressPlaceAnOrder() {
        actions.didPresentPlaceAnOrder()
    }
    
    func didPressConfirm() {
        
    }
}
