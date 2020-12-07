//
//  Categories.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation

struct Categorie: Equatable {
    let id: String
    let name: String
    let ingredients: [String]?
    let time: String
    let weight: String
    var imageData: Data?
    let imageURL: URL?
    let moreInfoURL: URL?
}
