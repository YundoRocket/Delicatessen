//
//  InformationsViewController.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class InformationsViewController: UIViewController {

    // MARK: - Properties

    var viewModel: InformationsViewModel!

    // MARK: - Outlets
    
    @IBOutlet weak private var informationView: UIView! {
        didSet {
            informationView.layer.borderWidth = 0.5
            informationView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            informationView.layer.cornerRadius = 20
        }
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
        setUI()
    }

    // MARK: - Helpers

    private func bind(to viewModel: InformationsViewModel) {
        
    }

    private func setUI() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self,
                                                          action: #selector(handleDismiss))
        panGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(panGestureRecognizer)
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
}

extension InformationsViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController
    ) -> UIPresentationController? {
             return HalfSizePresentationController(presentedViewController: presented,
                                                   presenting: presenting)
    }
}
