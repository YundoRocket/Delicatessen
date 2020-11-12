//
//  ShopDescriptionViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

final class ShopDescriptionViewModel {
    
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
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        
    }
    
    func didSelectPhoneNumber() {
        
    }
    
    func didSelectPlaceAnOrder() {
        
    }
}
