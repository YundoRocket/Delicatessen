//
//  Extensions.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

public extension UIView {
    public static var storyboardIdentifier: String {
        return String(describing: self)
    }

    public static var nib: UINib {
        return UINib.init(nibName: storyboardIdentifier, bundle: Bundle(for: self))
    }
}

public extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc public  func dismissKeyboard() {
        view.endEditing(true)
    }
}

public extension UIViewController {
    public func cartButtonitem(action: Selector?) -> UIBarButtonItem {
        let cart = UIBarButtonItem(image: UIImage(systemName: "cart"),
                                            style: .done,
                                            target: self,
                                            action: action)
        
        cart.tintColor = .black
        return cart
    }
}
