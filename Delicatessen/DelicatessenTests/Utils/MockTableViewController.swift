//
//  MockTableViewController.swift
//  DelicatessenTests
//
//  Created by Bertrand BLOC'H on 01/12/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

public class MockTableViewController: UITableViewController {

    public var cells: [UITableViewCell] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    public override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}
