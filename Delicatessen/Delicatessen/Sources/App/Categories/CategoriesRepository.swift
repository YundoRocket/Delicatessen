//
//  CategoriesRepository.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation
import DLNetwork

protocol CategoriesRepositoryType: class {
    func requestCategories(callback: @escaping (Result<CategoryResponse, HTTPClientError>) -> Void)
}

final class CategoriesRepository:  CategoriesRepositoryType {
    
    // MARK: - Properties
   
    private let network: HTTPClient
    private let token = RequestCancellationToken()

    // MARK: - Initializer

    init(network: HTTPClient) {
        self.network = network
    }

    // MARK: - CategoriesRepository

    func requestCategories(callback: @escaping (Result<CategoryResponse, HTTPClientError>) -> Void) {
        let baseUrl = "http://134.209.113.122/api/groups"
        guard let url = URL(string: baseUrl) else { return }

        network.request(
            requestType: .GET,
            url: url,
            cancelledBy: token) { ( result: Result<CategoryResponse, HTTPClientError>) in
            callback(result)
        }
    }
}
