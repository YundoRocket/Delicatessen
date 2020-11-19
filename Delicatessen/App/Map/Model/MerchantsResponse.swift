//
//  MerchantsResponse.swift
//  Delicatessen
//
//  Created by Damien Rojo on 14.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

// MARK: - MerchantsResponse
struct MerchantsResponse: Codable {
    let merchants: [Merchant]
}

// MARK: - Merchant
struct Merchant: Codable {
    let loc: LOC
    let timesheet: Timesheet
    let id, tag, merchantDescription, address: String
    let city, zip, country, email: String
    let phone: Int
    let img: String

    enum CodingKeys: String, CodingKey {
        case loc, timesheet
        case id = "_id"
        case tag
        case merchantDescription = "description"
        case address, city, zip, country, email, phone, img
    }
}

// MARK: - LOC
struct LOC: Codable {
    let coordinates: [Double]
    let type: String
}

// MARK: - Timesheet
struct Timesheet: Codable {
    let monday, tuesday, wednesday, thursday: String
    let friday, saturday, sunday: String
}
