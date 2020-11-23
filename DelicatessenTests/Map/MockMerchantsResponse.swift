//
//  MockMerchantsResponse.swift
//  DelicatessenTests
//
//  Created by Damien Rojo on 23.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation
@testable import Delicatessen

private let MerchantsResponseJSONData = """
{
   "merchants":[
      {
         "loc":{
            "coordinates":[
               46.2692259,
               6.3640214
            ],
            "type":"point"
         },
         "timesheet":{
            "monday":"08:00–20:00",
            "tuesday":"08:00–20:00",
            "wednesday":"08:00–20:00",
            "thursday":"08:00–20:00",
            "friday":"08:00–20:00",
            "saturday":"08:00–20:00",
            "sunday":"08:30–12:30"
         },
         "_id":"5fae84bb23df78f5a79b30fd",
         "tag":"Carrefour Market Bons-En-Chablais",
         "description":"Des produits frais et de qualité ainsi que des produits du quotidien à prix juste.",
         "address":"Rue de la Scie",
         "city":"Bons-en-Chablais",
         "zip":"74890",
         "country":"France",
         "email":"",
         "phone":33450394727,
         "img":""
      },
      {
         "loc":{
            "coordinates":[
               46.2733024,
               6.3923268
            ],
            "type":"point"
         },
         "timesheet":{
            "monday":"07:00–12:30, 15:30–20:00",
            "tuesday":"07:00–12:30, 15:30–20:00",
            "wednesday":"",
            "thursday":"07:00–12:30, 15:30–20:00",
            "friday":"07:00–12:30, 15:30–20:00",
            "saturday":"07:00–12:30, 15:30–20:00",
            "sunday":"07:00–12:30, 16:00–20:00"
         },
         "_id":"5faff452bd9cfa44092bf512",
         "tag":"Petit Casino",
         "description":"Petit Casino, vous assure au quotidien accueil, fraîcheur des produits, et sens du service.",
         "address":"12 Route de Morzier",
         "city":"Brenthonne",
         "zip":"74890",
         "country":"France",
         "email":"",
         "phone":33450361083,
         "img":""
      }
   ]
}
""".data(using: .utf8)!

let mockMerchantsResponse = try! JSONDecoder().decode(MerchantsResponse.self, from: MerchantsResponseJSONData)

