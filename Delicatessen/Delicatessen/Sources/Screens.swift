//
//  Screens.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit

public class Screens {
    
    let context: Context
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))

    init(
        context: Context
    ) {
       self.context = context
    }
}

extension Screens {
    func createMapViewController(actions: MapViewModel.Actions) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let repository = MapRepository(client: context.client)
        let viewModel = MapViewModel(
            repository: repository,
            actions: actions
        )
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createInformationsViewController(actions: InformationsViewModel.Actions) -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "InformationsViewController") as! InformationsViewController
        let viewModel = InformationsViewModel(actions: actions)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createCategoriesViewController(action: CategoriesViewModel.Actions) -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "CategoriesViewController") as! CategoriesViewController
        let viewModel = CategoriesViewModel(action: action)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createCartViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "CartViewController") as! CartViewController
        let viewModel = CartViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createAlert(with configuration: AlertConfiguration) -> UIAlertController {
        let alertController = UIAlertController()        
        alertController.title = configuration.title
        alertController.message = configuration.message
        let action = UIAlertAction(title: configuration.okMessage,
                                   style: .default,
                                   handler: nil)
        alertController.addAction(action)
        return alertController
    }
}
