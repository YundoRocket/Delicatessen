//
//  CategoriesCellTests.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import XCTest
import SnapshotTesting
@testable import Delicatessen

final class CategoryCollectionViewCellTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
        
    }

    func test_That_CreateCategoryCollectionViewCell() {
        let cell = SubCategoriesCollectionViewCell()
        cell.configure(with: .init(title: "Title", imageName: "Cheeses"))
        snapshotCell(cell)
    }
}
