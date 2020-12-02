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
        isRecording = true
        
    }
    func test_That_CreateCategoryCollectionViewCell() {
        let cell = CategoriesCollectionViewCell()
            
        cell.configure
    }

}
