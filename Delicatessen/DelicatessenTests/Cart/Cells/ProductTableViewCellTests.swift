//
//  ProductTableViewCellTests.swift
//  DelicatessenTests
//
//  Created by Bertrand BLOC'H on 01/12/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Delicatessen

final class ProductTableViewCellTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func test_that_createProductTableViewCell() {
        let viewModel = ProductViewModel(name: "Lemon", price: "3€")
        let cell = ProductTableViewCell()
        cell.configure(with: viewModel)
        snapshotCell(cell)
    }
}
