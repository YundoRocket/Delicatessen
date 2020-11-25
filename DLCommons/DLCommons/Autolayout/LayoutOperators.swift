//
//  LayoutOperators.swift
//  DLCommons
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//

import UIKit

// LayoutAnchor

public struct LayoutAnchorOffset<A: LayoutAnchor> {
    let anchor: LayoutAnchorProperty<A>
    let offset: CGFloat
}

public func +<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: CGFloat) -> LayoutAnchorOffset<A> {
    return LayoutAnchorOffset(anchor: lhs, offset: rhs)
}

public func -<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: CGFloat) -> LayoutAnchorOffset<A> {
    return LayoutAnchorOffset(anchor: lhs, offset: -rhs)
}

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: LayoutAnchorOffset<A>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.anchor, offsetBy: rhs.offset)
}

@discardableResult
public func ==<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: LayoutAnchorProperty<A>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: LayoutAnchorOffset<A>) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.anchor, offsetBy: rhs.offset)
}

@discardableResult
public func >=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: LayoutAnchorProperty<A>) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func <=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>,
                                rhs: LayoutAnchorOffset<A>) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs.anchor, offsetBy: rhs.offset)
}

@discardableResult
public func <=<A: LayoutAnchor>(lhs: LayoutAnchorProperty<A>, rhs: LayoutAnchorProperty<A>) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs)
}

// LayoutDimension

public struct LayoutDimensionOffset<A: LayoutDimension> {
    let dimension: LayoutDimensionProperty<A>
    let offset: CGFloat
}

public struct LayoutDimensionMultiplier<A: LayoutDimension> {
    let dimension: LayoutDimensionProperty<A>
    let multiplier: CGFloat
}

public struct LayoutDimensionMultiplierAndOffset<A: LayoutDimension> {
    let multiplier: LayoutDimensionMultiplier<A>
    let offset: CGFloat
}

public func +<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) -> LayoutDimensionOffset<A> {
    return LayoutDimensionOffset(dimension: lhs, offset: rhs)
}

public func -<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) -> LayoutDimensionOffset<A> {
    return LayoutDimensionOffset(dimension: lhs, offset: -rhs)
}

public func *<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) -> LayoutDimensionMultiplier<A> {
    return LayoutDimensionMultiplier(dimension: lhs, multiplier: rhs)
}

public func +<A: LayoutDimension>(lhs: LayoutDimensionMultiplier<A>, rhs: CGFloat) -> LayoutDimensionMultiplierAndOffset<A> {
    return LayoutDimensionMultiplierAndOffset(multiplier: lhs, offset: rhs)
}

public func -<A: LayoutDimension>(lhs: LayoutDimensionMultiplier<A>, rhs: CGFloat) -> LayoutDimensionMultiplierAndOffset<A> {
    return LayoutDimensionMultiplierAndOffset(multiplier: lhs, offset: -rhs)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionOffset<A>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.dimension, constant: rhs.offset)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: LayoutDimensionProperty<A>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionMultiplier<A>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.dimension, multiplier: rhs.multiplier)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionMultiplierAndOffset<A>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.multiplier.dimension, multiplier: rhs.multiplier.multiplier, constant: rhs.offset)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionOffset<A>) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.dimension, constant: rhs.offset)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: LayoutDimensionProperty<A>) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionMultiplier<A>) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.dimension, multiplier: rhs.multiplier)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionMultiplierAndOffset<A>) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.multiplier.dimension, multiplier: rhs.multiplier.multiplier, constant: rhs.offset)
}

@discardableResult
public func <=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionOffset<A>) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs.dimension, constant: rhs.offset)
}

@discardableResult
public func <=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: LayoutDimensionProperty<A>) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs)
}

@discardableResult
public func <=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionMultiplier<A>) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs.dimension, multiplier: rhs.multiplier)
}

@discardableResult
public func <=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: LayoutDimensionMultiplierAndOffset<A>) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs.multiplier.dimension, multiplier: rhs.multiplier.multiplier, constant: rhs.offset)
}

@discardableResult
public func ==<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func >=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func <=<A: LayoutDimension>(lhs: LayoutDimensionProperty<A>,
                                   rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs)
}

// Priority
precedencegroup PriorityPrecedence {
    associativity: none
    lowerThan: ComparisonPrecedence
}

infix operator ~: PriorityPrecedence
@discardableResult
public func ~ (lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}

