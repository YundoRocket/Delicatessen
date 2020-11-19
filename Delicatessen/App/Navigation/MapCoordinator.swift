//
//  MapCoordinator.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

final class MapCoordinator {

    // MARK: - Private Properties

    private let presenter: UINavigationController
    private var mapViewController: UIViewController?
    private let screens: Screens

    // MARK: - Initializer

    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }

    // MARK: - Coodinator

    func start() {
        showMap()
    }

    private func showMap() {
        let actions: MapViewModel.Actions = .init(
            didPresentShopDescription: {
            self.showShopDescription()
        }, didPresentCart: {
            self.showCart()
        })
        mapViewController = screens.createMapViewController(actions: actions)
        guard let mapViewController = mapViewController else { return }
        presenter.viewControllers = [mapViewController]
    }
    
    private func showShopDescription() {
        let actions: InformationsViewModel.Actions =  .init(
            didPresentShopDescription: {
                self.showCategories()
        })
        let viewController = screens.createShopDescriptionViewController(actions: actions)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .coverVertical
        presenter.showDetailViewController(viewController,
                                           sender: self)
    }
    
    private func showCategories() {
        let viewController = screens.createCategoriesViewController()
        presenter.pushViewController(viewController,
                                     animated: true)
    }
    
    private func showCart() {
        let viewController = screens.createCartViewController()
        presenter.showDetailViewController(viewController,
                                           sender: self)
    }
}
