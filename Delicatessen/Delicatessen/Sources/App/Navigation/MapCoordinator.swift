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
    private let screens: Screens
    private var informationsViewController: UIViewController?

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
            self.showInformations()
        }, didPresentCart: {
            self.showCart()
        })
        let mapViewController = screens.createMapViewController(actions: actions)
        presenter.viewControllers = [mapViewController]
    }
    
    private func showInformations() {
        let actions: InformationsViewModel.Actions =  .init(
            didPresentAlert: { alert in
                self.didPresentAlert(for: .alert(alertConfiguration: alert))

        },
            didPresentPlaceAnOrder: {
                self.showCategories()
        })
        let viewController = screens.createInformationsViewController(actions: actions)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .coverVertical
        presenter.showDetailViewController(viewController,
                                           sender: self)
    }
    
    private func showCategories() {
        let action: CategoriesViewModel.Actions = .init(
        didSelectCategory: { category in
            self.showSubCategories(for: category)
            
        })
        let viewController = screens.createCategoriesViewController(action: action)
        presenter.pushViewController(viewController,
                                     animated: true)
    }
    private func showSubCategories(for categorie: Categorie) {
        let action: CategoriesViewModel.Actions = .init(
        didSelectCategory: { _ in
            })
        let viewController = screens.createCategoriesViewController(action: action )
        presenter.pushViewController(viewController,
                                     animated: true)
    }
    
    private func showCart() {
        let viewController = screens.createCartViewController()
        presenter.showDetailViewController(viewController,
                                           sender: self)
    }
    
    func didPresentAlert(for alert: AlertType) {
        switch alert {
        case .alert(alertConfiguration: let configuration):
            let alertController = screens.createAlert(with: configuration)
            informationsViewController?.present(alertController,
                                        animated: true)
        }
    }
}

