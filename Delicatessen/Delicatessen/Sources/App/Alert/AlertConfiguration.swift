//
//  AlertConfiguration.swift
//  Delicatessen
//
//  Created by Damien Rojo on 24.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

struct AlertConfiguration: Equatable {
    let title: String
    let message: String
    let okMessage: String
    let cancelMessage: String?
}
