//
//  CategoryResponse.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation


// MARK: - Response
struct CategoryResponse: Codable {
    let categories: [Category]

    enum CodingKeys: String, CodingKey {
        case categories = "groups"
    }
}

// MARK: - Group
struct Category: Codable {
    let name: Name
    let id: String
    let categories: [SubCategory]

    enum CodingKeys: String, CodingKey {
        case name
        case id = "_id"
        case categories
    }

    // MARK: - Category
    struct SubCategory: Codable {
        let name: Name
        let image: String
        let products: [Product]
    }

    // MARK: - Name
    struct Name: Codable {
        let en, fr, de: String
    }

    // MARK: - Product
    struct Product: Codable {
        let name: Name
        let image: String
    }

}
