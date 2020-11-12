//
//  MapViewModelTests.swift
//  DelicatessenTests
//
//  Created by Damien Rojo on 12.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
@testable import Delicatessen

final class MapViewModelTests: XCTestCase {
    
    private var viewModel: MapViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = MapViewModel(actions: .init(didPresentShopDescription: {
            
        }))
    }
    
    func testGivenMapViewModel_WhenViewDidLoad_ThenSearchBarPlaceholder_IsCorrectlyReturned() {
        let expectation = self.expectation(description: "Search Bar Placeholder Returned")

        viewModel.searchBarPlaceholder = { text in
            XCTAssertEqual(text, "Entrez une adresse, une ville...")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenMapViewModel_WhenDidSelectShopDescription_ThenAction_IsCorrectlyReturned() {
        
        let actions: MapViewModel.Actions = .init {
            
        }
        
        viewModel = MapViewModel(actions: actions)
        
        viewModel.viewDidLoad()
        viewModel.didSelectShopDescription()
    }
}
