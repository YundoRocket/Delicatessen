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
    func requestCategories(callback: @escaping (Result<[CategoryResponse], Error>) -> Void)
}

final class CategoriesRepository:  CategoriesRepositoryType {
    
    
    // MARK: - Properties
   
    private let network: HTTPClient
    private let token = RequestCancellationToken()
    
    init(network: HTTPClient, token: RequestCancellationToken) {
        self.network = network
    }
    

    // MARK: - CategoriesRepository

    private let baseUrl = "https://api.edamam.com/search?"

    func requestCategories(callback: @escaping (Result<[CategoryResponse], Error>) -> Void) {
        
    }
}
