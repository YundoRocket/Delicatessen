//
//  LayoutProxy.swift
//  DLCommons
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//

import UIKit

var constraintCreationRegister: [NSLayoutConstraint]?

public protocol AnchorContainer {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

public protocol PropertiesContainer {
    var leading: LayoutAnchorProperty<NSLayoutXAxisAnchor> { get }
    var trailing: LayoutAnchorProperty<NSLayoutXAxisAnchor> { get }
    var left: LayoutAnchorProperty<NSLayoutXAxisAnchor> { get }
    var right: LayoutAnchorProperty<NSLayoutXAxisAnchor> { get }
    var top: LayoutAnchorProperty<NSLayoutYAxisAnchor> { get }
    var bottom: LayoutAnchorProperty<NSLayoutYAxisAnchor> { get }
    var width: LayoutDimensionProperty<NSLayoutDimension> { get }
    var height: LayoutDimensionProperty<NSLayoutDimension> { get }
    var centerX: LayoutAnchorProperty<NSLayoutXAxisAnchor> { get }
    var centerY: LayoutAnchorProperty<NSLayoutYAxisAnchor> { get }
}

public extension PropertiesContainer where Self: AnchorContainer {
    var leading: LayoutAnchorProperty<NSLayoutXAxisAnchor> { LayoutAnchorProperty(anchor: leadingAnchor) }
    var trailing: LayoutAnchorProperty<NSLayoutXAxisAnchor> { LayoutAnchorProperty(anchor: trailingAnchor) }
    var left: LayoutAnchorProperty<NSLayoutXAxisAnchor> { LayoutAnchorProperty(anchor: leftAnchor) }
    var right: LayoutAnchorProperty<NSLayoutXAxisAnchor> { LayoutAnchorProperty(anchor: rightAnchor) }
    var top: LayoutAnchorProperty<NSLayoutYAxisAnchor> { LayoutAnchorProperty(anchor: topAnchor) }
    var bottom: LayoutAnchorProperty<NSLayoutYAxisAnchor> { LayoutAnchorProperty(anchor: bottomAnchor) }
    var width: LayoutDimensionProperty<NSLayoutDimension> { LayoutDimensionProperty(anchor: widthAnchor) }
    var height: LayoutDimensionProperty<NSLayoutDimension> { LayoutDimensionProperty(anchor: heightAnchor) }
    var centerX: LayoutAnchorProperty<NSLayoutXAxisAnchor> { LayoutAnchorProperty(anchor: centerXAnchor) }
    var centerY: LayoutAnchorProperty<NSLayoutYAxisAnchor> { LayoutAnchorProperty(anchor: centerYAnchor) }
}

extension UIView: AnchorContainer, PropertiesContainer {}
extension UILayoutGuide: AnchorContainer, PropertiesContainer {}

public extension UIView {

    /// Fills the source view to it's superview with insets. Also you can specify if you want it to be relative to it's superview safe area or not.
    ///
    /// Please use
    ///
    /// ```
    /// view.makeLayout {
    ///     $0.fillSuperview()
    /// }
    /// ```
    ///
    /// to call this method as `makeLayout` setup `translatesAutoresizingMaskIntoConstraints = false`.
    ///
    /// Otherwise you can do
    ///
    /// ```
    /// view.translatesAutoresizingMaskIntoConstraints = false
    /// view.layout.fillSuperview()
    /// ```
    ///
    func fillSuperview(with margins: UIEdgeInsets = .zero, relativeToSafeArea: Bool = false) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        if relativeToSafeArea {
            return [
                top.equal(to: superview.safeAreaLayoutGuide.top, offsetBy: margins.top),
                left.equal(to: superview.safeAreaLayoutGuide.left, offsetBy: margins.left),
                bottom.equal(to: superview.safeAreaLayoutGuide.bottom, offsetBy: -margins.bottom),
                right.equal(to: superview.safeAreaLayoutGuide.right, offsetBy: -margins.right)
            ]
        } else {
            return [
                top.equal(to: superview.top, offsetBy: margins.top),
                left.equal(to: superview.left, offsetBy: margins.left),
                bottom.equal(to: superview.bottom, offsetBy: -margins.bottom),
                right.equal(to: superview.right, offsetBy: -margins.right)
            ]
        }
    }

    /// Setup an aspect ratio.
    ///
    /// Please use
    ///
    /// ```
    /// view.makeLayout {
    ///     $0.aspectRatio(1.5)
    /// }
    /// ```
    ///
    /// to call this method as `makeLayout` setup `translatesAutoresizingMaskIntoConstraints = false`.
    ///
    /// Otherwise you can do
    ///
    /// ```
    /// view.translatesAutoresizingMaskIntoConstraints = false
    /// view.layout.aspectRatio(1.5)
    /// ```
    ///
    func aspectRatio(_ ratio: CGFloat = 1) -> NSLayoutConstraint {
        return width.equal(to: height, multiplier: ratio)
    }

    /// Center the source view into the target view.
    ///
    /// Please use
    ///
    /// ```
    /// view.makeLayout {
    ///     $0.center(targetView)
    /// }
    /// ```
    ///
    /// to call this method as `makeLayout` setup `translatesAutoresizingMaskIntoConstraints = false`.
    ///
    /// Otherwise you can do
    ///
    /// ```
    /// view.translatesAutoresizingMaskIntoConstraints = false
    /// view.layout.center(targetView)
    /// ```
    ///
    func center(_ otherView: UIView) -> [NSLayoutConstraint] {
        return [
            centerX.equal(to: otherView.centerX),
            centerY.equal(to: otherView.centerY)
        ]
    }

    /// Center the source view into it's superview.
    ///
    /// Please use
    ///
    /// ```
    /// view.makeLayout {
    ///     $0.centerSuperview()
    /// }
    /// ```
    ///
    /// to call this method as `makeLayout` setup `translatesAutoresizingMaskIntoConstraints = false`.
    ///
    /// Otherwise you can do
    ///
    /// ```
    /// view.translatesAutoresizingMaskIntoConstraints = false
    /// view.layout.centerSuperview()
    /// ```
    ///
    func centerSuperview() -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return center(superview)
    }
}

public class LayoutProxy {
    let view: UIView

    init(view: UIView) {
        self.view = view
    }

    /// Property for `leadingAnchor`
    public lazy var leading = view.leading
    /// Property for `trailingAnchor`
    public lazy var trailing = view.trailing
    /// Property for `leftAnchor`
    public lazy var left = view.left
    /// Property for `rightAnchor`
    public lazy var right = view.right
    /// Property for `topAnchor`
    public lazy var top = view.top
    /// Property for `bottomAnchor`
    public lazy var bottom = view.bottom
    /// Property for `widthAnchor`
    public lazy var width = view.width
    /// Property for `heightAnchor`
    public lazy var height = view.height
    /// Property for `centerXAnchor`
    public lazy var centerX = view.centerX
    /// Property for `centerYAnchor`
    public lazy var centerY = view.centerY

    //Safe area
    /// Property for `topAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeTop = view.safeAreaLayoutGuide.top
    /// Property for `bottomAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeBottom = view.safeAreaLayoutGuide.bottom
    /// Property for `leftAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeLeft = view.safeAreaLayoutGuide.left
    /// Property for `rightAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeRight = view.safeAreaLayoutGuide.right
    /// Property for `leadingAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeLeading = view.safeAreaLayoutGuide.leading
    /// Property for `trailingAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeTrailing = view.safeAreaLayoutGuide.trailing
    /// Property for `widthAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeWidth = view.safeAreaLayoutGuide.width
    /// Property for `heightAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeHeight = view.safeAreaLayoutGuide.height
    /// Property for `centerXAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeCenterX = view.safeAreaLayoutGuide.centerX
    /// Property for `centerYAnchor`. In case it's iOS > 11.0, it's related to `safeAreaLayoutGuide`.
    public lazy var safeCenterY = view.safeAreaLayoutGuide.centerY

    @discardableResult
    public func fillSuperview(with margins: UIEdgeInsets = .zero, relativeToSafeArea: Bool = false) -> [NSLayoutConstraint] {
        view.fillSuperview(with: margins, relativeToSafeArea: relativeToSafeArea)
    }

    @discardableResult
    public func aspectRatio(_ ratio: CGFloat = 1) -> NSLayoutConstraint {
        return view.aspectRatio(ratio)
    }

    @discardableResult
    public func center(_ otherView: UIView) -> [NSLayoutConstraint] {
        return view.center(otherView)
    }

    @discardableResult
    public func centerSuperview() -> [NSLayoutConstraint] {
        return view.centerSuperview()
    }
}

public extension UIView {

    /// ⚠️ This property is deprecated. You can access all properties from the layout directly from the view itself and also from the different UILayoutGuide. Layout proxy for the current view. This can be used to create constraints with operators. If the view is the source view, you should use `makeLayout { ... }` method instead, as this sets the property `translatesAutoresizingMaskIntoConstraints = false`.
    var layout: LayoutProxy {
        return LayoutProxy(view: self)
    }

    /// This method provides the layout proxy and setup `translatesAutoresizingMaskIntoConstraints = false`.
    /// Inside the provided block you can create all the constraints using the property operators to create them.
    ///
    /// Example:
    ///
    /// ```
    /// textLabel.makeLayout {
    ///     $0.top == titleLabel.bottom + 20
    ///     $0.centerX <= titleLabel.centerX
    ///     $0.width == titleLabel.width + 10 ~ .defaultLow
    ///     $0.height >= titleLabel.height
    /// }
    /// ```
    ///
    /// Anchors (like `top`, `left`, `right`, `bottom`, `centerX`, `centerY`, `leading`, `trailing`) and Dimensions (like `width`, `height`) can be related with `==`, `>=` and `<=`.
    ///
    /// Additionally, you can add an offset with +/- at the end.
    ///
    /// Finally, you can add the operator ~ to define a priority
    ///
    /// For Dimensions, there's also the option to assign it directly to a value like this:
    ///
    /// ```
    /// textLabel.makeLayout {
    ///     $0.width == 10
    /// }
    /// ```
    ///
    /// Or even create a multiplier relation like this:
    ///
    /// ```
    /// textLabel.makeLayout {
    ///     $0.width == titleLabel.width * 3
    ///     $0.height == titleLabel.height * 2 + 10
    /// }
    /// ```
    ///
    /// - Parameter closure: The block with the proxy as a parameter. Inside this block you should do all the layout constructions. All the constraints created inside the block will be captured and automatically activated.
    func makeLayout(closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        constraintCreationRegister = [NSLayoutConstraint]()
        closure(layout)
        constraintCreationRegister.flatMap(NSLayoutConstraint.activate(_:))
        constraintCreationRegister = nil
    }
}
