//
//  ShopDescriptionViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 17.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation
import DLCommons

final class ShopDescriptionViewModel {
    
    // MARK: - Privates Properties
    
    private var viewModel: InformationsViewModel!
    
    // MARK: - Outputs
    
    var shopNameText: InputClosure<String>?
    var shopAddressText: InputClosure<String>?
    
    // Phone
    var phoneText: InputClosure<String>?
    var phoneNumberText: InputClosure<String>?
    
    // Hours
    var shopHoursText: InputClosure<String>?
    var hoursMondayText: InputClosure<String>?
    var hoursTuesdayText: InputClosure<String>?
    var hoursWednesdayText: InputClosure<String>?
    var hoursThursdayText: InputClosure<String>?
    var hoursFridayText: InputClosure<String>?
    var hoursSaturdayText: InputClosure<String>?
    var hoursSundayText: InputClosure<String>?
    var placeAnOrderText: InputClosure<String>?

    let actions: Actions

    struct Actions {
    }

    init(actions: Actions) {
        self.actions = actions
    }

    // MARK: - Inputs
    
    func viewDidLoad() {
        phoneText?("Téléphone")
        shopHoursText?("Horaires")
    }
    
    func didPressPhoneNumder() {
        
    }
    
    func didPressPlaceAnOrder() {
        viewModel.didPressPlaceAnOrder()
    }
}
