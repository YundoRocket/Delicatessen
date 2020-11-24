//
//  ValidateOrderViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 17.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

final class ValidateOrderViewModel {
    
    // MARK: - Privates Properties
    
    private var viewModel: InformationsViewModel!
    
    // MARK: - Outlets
    
    var validateOrderText: InputClosure<String>?
    var descriptionText: InputClosure<String>?
    var namePlaceholderText: InputClosure<String>?
    var phoneNumberPlaceholderText: InputClosure<String>?
    var emailPlaceholderText: InputClosure<String>?
    var confirmText: InputClosure<String>?

    // MARK: - Inputs
    
    func viewDidLoad() {
        validateOrderText?("Valider la commande")
        descriptionText?("Vous êtes sur le point de valider votre commande! Veuillez remplir vos informations pour le commerçant")
        namePlaceholderText?("Nom")
        phoneNumberPlaceholderText?("Numéro de téléphone")
        emailPlaceholderText?("Adresse mail")
        confirmText?("Confimer")
    }
    
    func didPressConfirm() {
        viewModel.didPressConfirm()
    }
}
