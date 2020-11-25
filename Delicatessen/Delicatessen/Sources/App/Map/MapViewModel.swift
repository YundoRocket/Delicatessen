//
//  MapViewModel.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import Foundation
import DLCommons
import MapKit

final class MapViewModel {

    // MARK: - Privates Properties

    private let repository: MapRepositoryType
    private let actions: Actions

    struct Actions {
        let didPresentShopDescription: VoidClosure
        let didPresentCart: VoidClosure
    }

    private var shopItems: [ShopItem] = [] {
        didSet {
            let items = shopItems.map { ShopData(shopItems: $0) }
            self.shops?(items)
        }
    }

    enum ShopItem {
        case shops(response: Merchant)
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
    var shops: InputClosure<[ShopData]>?

    // MARK: - Inputs

    func viewDidLoad() {
        searchBarPlaceholder?("Entrez une adresse, une ville...")
        repository.getMerchants { (merchant) in
            merchant.merchants.lazy.forEach { self.shopItems.append(.shops(response: $0))}

        }
    }

    func didSelectShopDescription() {
        actions.didPresentShopDescription() 
    }
    
    func didSelectCart() {
        actions.didPresentCart()
    }
}

extension ShopData {
    init(shopItems: MapViewModel.ShopItem) {
        switch shopItems {
        case .shops(response: let response):
            self = ShopData(response: response)
        }
    }
}
