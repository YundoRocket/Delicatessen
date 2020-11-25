//
//  LayoutDimensionProperty.swift
//  DLCommons
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//

import UIKit

public struct LayoutDimensionProperty<Anchor: LayoutDimension> {
    private let anchor: Anchor

    init(anchor: Anchor) {
        self.anchor = anchor
    }
}

extension LayoutDimensionProperty {
    @discardableResult
    func equal(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalToConstant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func greaterThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func lessThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func equal(to otherAnchor: LayoutDimensionProperty,
               multiplier: CGFloat = 1,
               constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: otherAnchor.anchor,
                                           multiplier: multiplier,
                                           constant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func greaterThanOrEqual(to otherAnchor: LayoutDimensionProperty,
                            multiplier: CGFloat = 1,
                            constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor.anchor,
                                           multiplier: multiplier,
                                           constant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }

    @discardableResult
    func lessThanOrEqual(to otherAnchor: LayoutDimensionProperty,
                         multiplier: CGFloat = 1,
                         constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor.anchor,
                                           multiplier: multiplier,
                                           constant: constant)
        constraintCreationRegister?.append(constraint)
        return constraint
    }
}

