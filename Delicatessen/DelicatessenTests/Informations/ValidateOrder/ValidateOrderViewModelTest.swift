//
//  ValidateOrderViewModelTest.swift
//  DelicatessenTests
//
//  Created by Damien Rojo on 18.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
@testable import Delicatessen

final class ValidateOrderViewModelTest: XCTestCase {

    func testGivenValidateOrderViewModel_WhenViewDidLoad_ThenValidateOrderText_IsCorrectlyReturned() {
        let viewModel = ValidateOrderViewModel()
        let expectation = self.expectation(description: "Validate Order Text returned")
        
        viewModel.validateOrderText = { text in
            XCTAssertEqual(text, "Valider la commande")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenValidateOrderViewModel_WhenViewDidLoad_ThenDescriptionText_IsCorrectlyReturned() {
        let viewModel = ValidateOrderViewModel()
        let expectation = self.expectation(description: "Description Text returned")
        
        viewModel.descriptionText = { text in
            XCTAssertEqual(text, "Vous êtes sur le point de valider votre commande! Veuillez remplir vos informations pour le commerçant")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenValidateOrderViewModel_WhenViewDidLoad_ThenNamePlaceholderText_IsCorrectlyReturned() {
        let viewModel = ValidateOrderViewModel()
        let expectation = self.expectation(description: "Name Placeholder Text returned")
        
        viewModel.namePlaceholderText = { text in
            XCTAssertEqual(text, "Nom")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenValidateOrderViewModel_WhenViewDidLoad_ThenPhoneNumberPlaceholderText_IsCorrectlyReturned() {
        let viewModel = ValidateOrderViewModel()
        let expectation = self.expectation(description: "Phone Number Placeholder Text returned")
        
        viewModel.phoneNumberPlaceholderText = { text in
            XCTAssertEqual(text, "Numéro de téléphone")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenValidateOrderViewModel_WhenViewDidLoad_ThenEmailPlaceholderText_IsCorrectlyReturned() {
        let viewModel = ValidateOrderViewModel()
        let expectation = self.expectation(description: "Email Placeholder Text returned")
        
        viewModel.emailPlaceholderText = { text in
            XCTAssertEqual(text, "Adresse mail")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenValidateOrderViewModel_WhenViewDidLoad_ThenConfirmText_IsCorrectlyReturned() {
        let viewModel = ValidateOrderViewModel()
        let expectation = self.expectation(description: "Confirm Text returned")
        
        viewModel.confirmText = { text in
            XCTAssertEqual(text, "Confimer")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
