//
//  ValidateOrder.swift
//  Delicatessen
//
//  Created by Damien Rojo on 15.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class ValidateOrderView: UIView {
    
    // MARK: - Privates Properties
    
    private var viewModel: ValidateOrderViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet private var view: UIView!
    @IBOutlet weak private var validateOrderLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var phoneNumberTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var confirmButton: UIButton!
    
    // MARK: - Init

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
        Bundle.main.loadNibNamed("ValidateOrderView", owner: self, options: nil)
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func bind(to viewModel: ValidateOrderViewModel) {
        viewModel.validateOrderText = { [weak self] text in
            DispatchQueue.main.async {
                self?.validateOrderLabel.text = text
            }
        }
        
        viewModel.descriptionText = { [weak self] text in
            DispatchQueue.main.async {
                self?.descriptionLabel.text = text
            }
        }
        
        viewModel.namePlaceholderText = { [weak self] placeholder in
            DispatchQueue.main.async {
                self?.nameTextField.placeholder = placeholder
            }
        }
        
        viewModel.phoneNumberPlaceholderText = { [weak self] placeholder in
            DispatchQueue.main.async {
                self?.phoneNumberTextField.placeholder = placeholder
            }
        }
        
        viewModel.emailPlaceholderText = { [weak self] placeholder in
            DispatchQueue.main.async {
                self?.emailTextField.placeholder = placeholder
            }
        }
        
        viewModel.confirmText = { [weak self] text in
            DispatchQueue.main.async {
                self?.confirmButton.setTitle(text, for: .normal)
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func didPressConfirmButton(_ sender: UIButton) {
        viewModel.didPressConfirm()
    }
}
