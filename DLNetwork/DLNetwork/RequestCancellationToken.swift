//
//  RequestCancellationToken.swift
//  DLNetwork
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

open class RequestCancellationToken {
    
    public init() {}
    
    deinit {
        willDealocate?()
    }
    
    open var willDealocate: (() -> Void)?
}
