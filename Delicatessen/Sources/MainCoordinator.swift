//
//  MainCoordinator.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

enum ViewControllerItem: Int {
    case map = 0
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil)
    ]

    init() {
        self[.map].tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    }
}

final class MainCoordinator: NSObject {

    // MARK: - Properties
    
    private let presenter: UIWindow
    private let screens: Screens
    private var homeCoordinator: MapCoordinator?
    private let tabBarController: UITabBarController
    private var tabBarSource = TabBarSource()

    // MARK: - Init

    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter

        screens = Screens(context: context)

        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.map]

        super.init()

        tabBarController.delegate = self
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = tabBarController
        showMap()
    }

    private func showMap() {
        homeCoordinator = MapCoordinator(presenter: tabBarSource[.map], screens: screens)
        homeCoordinator?.start()
    }
    
    private func showProfile() {
        
    }
    
}

extension MainCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .map:
            showMap()
        }
    }
}
