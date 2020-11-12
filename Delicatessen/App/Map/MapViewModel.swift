//
//  MapViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation

final class MapViewModel {

    // MARK: - Privates Properties

    private let actions: Actions

    struct Actions {
        let didPresentShopDescription: VoidClosure
    }

    // MARK: - Init

    init(
        actions: Actions
    ) {
        self.actions = actions
    }

    // MARK: - Outputs

    var searchBarPlaceholder: InputClosure<String>?
    var shops: InputClosure<[[String: Any]]>?

    // MARK: - Inputs

    func viewDidLoad() {
        searchBarPlaceholder?("Entrez une adresse, une ville...")
    }

    func didSelectShopDescription() {
        actions.didPresentShopDescription() 
    }
}
