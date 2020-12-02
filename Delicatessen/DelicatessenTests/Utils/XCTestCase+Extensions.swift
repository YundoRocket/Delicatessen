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

    func snapshotCell(_ cell: UICollectionViewCell, testName: String = #function, file: StaticString = #file, line: UInt = #line) {
        let collectionView = Mock.getCollectionView(on: .iPhoneXs)
        let width = collectionView.frame.width / 1
        let size = CGSize(width: width, height: width * 2)
        let frame = CGRect(origin: .zero, size: size)
        cell.frame = frame
        let view = UIView(frame: frame)
        view.addSubview(cell)
        view.backgroundColor = .white
        assertSnapshot(matching: view, as: .image, file: file, testName: testName, line: line)
    }
}

enum Mock {}

extension Mock {
    static func getCollectionView(on device: Mock.Device) -> UICollectionView {
        UICollectionView(frame: device.frame, collectionViewLayout: UICollectionViewFlowLayout())
    }
}

extension Mock {
    enum Device: Equatable {
        case iPhoneXs
        case iPadMini(landscape: Bool)

        var frame: CGRect {
            let size: CGSize = {
                switch self {
                case .iPhoneXs:
                    return .init(width: 375, height: 812)
                case .iPadMini(landscape: let isLandscape):
                    guard isLandscape else {
                        return .init(width: 768, height: 1024)
                    }
                    return .init(width: 1024, height: 768)
                }
            }()
            return .init(origin: .zero, size: size)
        }
    }
}
