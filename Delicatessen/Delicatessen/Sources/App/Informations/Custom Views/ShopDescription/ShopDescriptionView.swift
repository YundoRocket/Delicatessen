//
//  ShopDescription.swift
//  Delicatessen
//
//  Created by Damien Rojo on 15.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

class ShopDescriptionView: UIView {

    // MARK: - Privates Properties

    private var viewModel: ShopDescriptionViewModel!

    // MARK: - Outlets

    @IBOutlet private var view: UIView! {
            didSet {
                view.layer.borderWidth = 0.5
                view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                view.layer.cornerRadius = 20
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
    @IBOutlet weak private var placeAnOrderButton: UIButton!
    
    // Mark: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        bind(to: viewModel)
        viewModel.viewDidLoad()
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    private func initialize() {
        Bundle.main.loadNibNamed("ShopDescriptionView", owner: self, options: nil)
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
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
                self?.phoneNumberButton.setTitle(text, for: .normal)
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
                self?.placeAnOrderButton.setTitle(text, for: .normal)
            }
        }
    }
    
    // MARK: - Actions
        
    @IBAction private func didPressPhoneNumberButton(_ sender: UIButton) {
    
    }
    
    @IBAction private func didPressPlaceAnOrderButton(_ sender: UIButton) {
        viewModel.didPressPlaceAnOrder()
    }
}
