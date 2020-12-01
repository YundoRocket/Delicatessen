//
//  XCTestCase+Extensions.swift
//  DelicatessenTests
//
//  Created by Bertrand BLOC'H on 01/12/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import XCTest
import UIKit
import SnapshotTesting
import DLCommons

public extension XCTestCase {
    func snapshotCell(_ cell: UITableViewCell, testName: String = #function, file: StaticString = #file, line: UInt = #line) {
        let viewController = MockTableViewController()
        viewController.view.frame = UIScreen.main.bounds
        viewController.tableView.separatorStyle = .none
        viewController.cells = [cell]
        let indexPath = IndexPath(row: 0, section: 0)
        assertSnapshot(matching: viewController.tableView.cellForRow(at: indexPath)!, as: .image, file: file, testName: testName, line: line)
    }
}
