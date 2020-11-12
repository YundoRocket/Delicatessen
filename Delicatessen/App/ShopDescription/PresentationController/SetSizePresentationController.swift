//
//  SetSizePresentationController.swift
//  Delicatessen
//
//  Created by Damien Rojo on 11.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class HalfSizePresentationController : UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard let theView = containerView else {
                return CGRect.zero
            }
            return CGRect(x: 0,
                          y: theView.bounds.height/2,
                          width: theView.bounds.width,
                          height: theView.bounds.height/2)
        }
    }
}
