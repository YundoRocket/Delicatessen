//
//  RequestCancellationToken.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

final class RequestCancellationToken {
    
    init() {}
    
    deinit {
        willDealocate?()
    }
    
    var willDealocate: (() -> Void)?
}
