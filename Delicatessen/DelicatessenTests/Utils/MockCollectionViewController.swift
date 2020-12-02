//
//  MockCollectionViewController.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import UIKit

public class MockCollectionViewController: UICollectionViewController {

    public var cells: [UICollectionView] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    public func collectionView(_ collectionView: UICollectionView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionView {
        return cells[indexPath.row]
    }
}

