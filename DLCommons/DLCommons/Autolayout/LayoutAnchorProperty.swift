//
//  LayoutAnchorProperty.swift
//  DLCommons
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//

import UIKit

public struct LayoutAnchorProperty<Anchor: LayoutAnchor> {
    private let anchor: Anchor

    init(anchor: Anchor) {
        self.anchor = anchor
    }
}

extension LayoutAnchorProperty {
    @discardableResult
    func equal(to otherAnchor: LayoutAnchorProperty, offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherAnchor.anchor,
                                           constant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func greaterThanOrEqual(to otherAnchor: LayoutAnchorProperty,
                            offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor.anchor,
                                           constant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func lessThanOrEqual(to otherAnchor: LayoutAnchorProperty,
                         offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor.anchor,
                                           constant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }
}

