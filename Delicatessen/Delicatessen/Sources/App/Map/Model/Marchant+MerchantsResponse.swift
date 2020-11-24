//
//  Marchant+MerchantsResponse.swift
//  Delicatessen
//
//  Created by Damien Rojo on 14.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

extension ShopData {
    init(response: Merchant) {
        self.coordinates = response.loc.coordinates
        self.name = "\(response.tag)"
        self.address = "\(response.address), \(response.zip), \(response.city)"
        self.phoneNumber = "\(response.phone)"
        self.email = "\(response.email)"
        self.hoursMonday = "\(response.timesheet.monday)"
        self.hoursTuesday = "\(response.timesheet.tuesday)"
        self.hoursWednesday = "\(response.timesheet.wednesday)"
        self.hoursThursday = "\(response.timesheet.thursday)"
        self.hoursFriday = "\(response.timesheet.friday)"
        self.hoursSaturday = "\(response.timesheet.saturday)"
        self.hoursSunday = "\(response.timesheet.sunday)"
    }
}
