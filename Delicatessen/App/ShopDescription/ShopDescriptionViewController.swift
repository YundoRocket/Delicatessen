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

    var viewModel: ShopDescriptionViewModel!

    // MARK: - Outlets
    
    @IBOutlet weak private var shopDescriptionView: UIView! {
        didSet {
            shopDescriptionView.layer.borderWidth = 0.5
            shopDescriptionView.layer.cornerRadius = 25
            shopDescriptionView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }

    @IBOutlet weak private var shopNameLabel: UILabel!
    @IBOutlet weak private var shopAddressLabel: UILabel!

    // Phone
    @IBOutlet weak private var phoneLabel: UILabel!
    @IBOutlet weak private var phoneNumberButton: UIButton!
    
    // Hours
    @IBOutlet weak private var shopHoursLabel: UILabel!
    @IBOutlet weak private var hoursMondayLabel: UILabel!
    @IBOutlet weak private var hoursTuesdayLabel: UILabel!
    @IBOutlet weak private var hoursWednesdayLabel: UILabel!
    @IBOutlet weak private var hoursThursdayLabel: UILabel!
    @IBOutlet weak private var hoursFridayLabel: UILabel!
    @IBOutlet weak private var hoursSaturdayLabel: UILabel!
    @IBOutlet weak private var hoursSundayLabel: UILabel!
    
    // Place an order
    @IBOutlet weak private var placeAnOrderButton: UIButton! {
        didSet {
            placeAnOrderButton.layer.borderWidth = 0.5
            placeAnOrderButton.layer.cornerRadius = 20
            placeAnOrderButton.layer.borderColor = #colorLiteral(red: 0, green: 0.3187746108, blue: 0.1371203661, alpha: 1)
        }
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Helpers
    
    private func bind(to viewModel: ShopDescriptionViewModel) {
        viewModel.shopNameText = { [weak self] text in
            DispatchQueue.main.async {
                self?.shopNameLabel.text = text
            }
        }

        viewModel.shopAddressText = { [weak self] text in
            DispatchQueue.main.async {
                self?.shopAddressLabel.text = text
            }
        }

        viewModel.phoneText = { [weak self] text in
            DispatchQueue.main.async {
                self?.phoneLabel.text = text
            }
        }

        viewModel.phoneNumberText = { [weak self] text in
            DispatchQueue.main.async {
                self?.phoneNumberButton.setTitle(text,
                                                 for: .normal)
            }
        }

        viewModel.shopHoursText = { [weak self] text in
            DispatchQueue.main.async {
                self?.shopHoursLabel.text = text
            }
        }

        viewModel.hoursMondayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursMondayLabel.text = text
            }
        }

        viewModel.hoursTuesdayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursTuesdayLabel.text = text
            }
        }

        viewModel.hoursWednesdayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursWednesdayLabel.text = text
            }
        }

        viewModel.hoursThursdayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursThursdayLabel.text = text
            }
        }

        viewModel.hoursFridayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursFridayLabel.text = text
            }
        }

        viewModel.hoursSaturdayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursSaturdayLabel.text = text
            }
        }

        viewModel.hoursSundayText = { [weak self] text in
            DispatchQueue.main.async {
                self?.hoursSundayLabel.text = text
            }
        }

        viewModel.placeAnOrderText = { [weak self] text in
            DispatchQueue.main.async {
                self?.placeAnOrderButton.setTitle(text,
                                                  for: .normal)
            }
        }
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
    
    // MARK: - Actions

    @IBAction private func didSelectPhoneNumberButton(_ sender: UIButton) {
        guard let phoneNumber = sender.titleLabel?.text else { return }
        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
        UIApplication.shared.open(url, options:[:], completionHandler: nil)
    }
   

    @IBAction private func didSelectPlaceAnOrderButton(_ sender: UIButton) {
        viewModel.didSelectPlaceAnOrder()
    }
}

extension ShopDescriptionViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController
    ) -> UIPresentationController? {
             return HalfSizePresentationController(presentedViewController: presented,
                                                   presenting: presenting)
    }
}
