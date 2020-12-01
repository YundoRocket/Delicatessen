//
//  CartViewControllerTests.swift
//  DelicatessenTests
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Delicatessen

final class CartViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func testThatCreateCartViewController() {
        let viewModel = CartViewModel()
        let viewController = CartViewController(viewModel: viewModel)

        assertSnapshot(
            matching: UINavigationController(rootViewController: viewController),
            as: .image
        )
    }
}

