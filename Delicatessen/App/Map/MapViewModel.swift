//
//  MapViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation
import MapKit


final class MapViewModel {

    // MARK: - Privates Properties

    private let repository: MapRepositoryType
    private let actions: Actions

    struct Actions {
        let didPresentShopDescription: VoidClosure
    }

    // MARK: - Init

    init(
        repository: MapRepositoryType,
        actions: Actions
    ) {
        self.actions = actions
        self.repository = repository
    }

    // MARK: - Outputs

    var searchBarPlaceholder: InputClosure<String>?
    var shops: InputClosure<[Shop]>?

    // MARK: - Inputs

    func viewDidLoad() {
        searchBarPlaceholder?("Entrez une adresse, une ville...")
        repository.getMerchants { (merchant) in
            guard let latitude = merchant.merchants.first?.loc.coordinates[0],
                let longitude = merchant.merchants.first?.loc.coordinates[1]
                else { return }
            
            guard let latitudeL = merchant.merchants.last?.loc.coordinates[0],
            let longitudeL = merchant.merchants.last?.loc.coordinates[1]
                else { return }
            
            self.shops?([Shop(title: merchant.merchants.first?.tag, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), subtitle: merchant.merchants.first?.merchantDescription), Shop(title: merchant.merchants.last?.tag, coordinate: CLLocationCoordinate2D(latitude: latitudeL, longitude: longitudeL), subtitle: merchant.merchants.last?.merchantDescription)])
            
        }
    }

    func didSelectShopDescription() {
        actions.didPresentShopDescription() 
    }
}
