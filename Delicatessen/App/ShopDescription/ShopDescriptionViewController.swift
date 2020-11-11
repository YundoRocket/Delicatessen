//
//  ShopDescriptionViewController.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class ShopDescriptionViewController: UIViewController {
    
    // MARK: - Properties

    var viewModel: shopDescriptionViewModel!
    
    // MARK: - Outlets
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleDismiss))
        panGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(panGestureRecognizer)
    }

     
    // MARK: - Helpers
    
    private func setUI() {

    }
    
    @objc func handleDismiss (recognizer: UIPanGestureRecognizer) {
        let viewTranslation = recognizer.translation(in: view)
        switch recognizer.state {
        case .changed:
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut, animations: {
                guard viewTranslation.y > 0 else {return}
                self.view.transform = CGAffineTransform(translationX: 0,
                                                        y: viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 250 {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.7,
                               initialSpringVelocity: 1,
                               options: .curveEaseOut,
                               animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true,
                        completion: nil)
            }
        default:
            break
        }
    }
    
    // MARK: - Actions
    
    
}

extension ShopDescriptionViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
             return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }

}
