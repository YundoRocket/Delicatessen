//
//  ViewModel.swift
//  Delicatessen
//
//  Copyright © 2020 Patrick Wiley
//
//

import Foundation


//
// HomeViewModel.swift
// MarketPlace
//
// Created by Bertrand BLOC’H on 24/03/2020.
// Copyright © 2020 veepee. All rights reserved.
//
import Foundation
//import VPTranslator
//import VPCommons

final class HomeViewModel {
  // MARK: - Properties
//  private let repository: HomeRepositoryType
//  private let translator: TranslatorType
//  private let homeConfiguration: HomeConfiguration
//  private let analytics: AnalyticsType
  private let actions: Actions
  private var thematicName: String?
  private var productItems: [ProductItem] = [] {
    didSet {
      let items = productItems.map { Item(productItem: $0, translator: self.translator) }
      visibleItems?(items)
    }
  }
  private let dialogAlertFactory = DialogAlertDataSourceFactory()
  // MARK: - Initializer
  init(
    repository: HomeRepositoryType,
    translator: TranslatorType,
    analytics: AnalyticsType,
    homeConfiguration: HomeConfiguration,
    actions: Actions
  ) {
    self.repository = repository
    self.translator = translator
    self.analytics = analytics
    self.homeConfiguration = homeConfiguration
    self.actions = actions
  }
  // MARK: - Outputs
  var merchantInfos: ((MerchantInfos) -> Void)?
  var visibleItems: (([Item]) -> Void)?
  var hideNavigation: ((Bool) -> Void)?
  var titleText: ((String) -> Void)?
  var displayedError: ((DialogAlertDataSource) -> Void)?
  // MARK: - Properties
  struct Actions {
    let selectCart: VoidClosure
    let displayEmptyCartAlert: VoidClosure
    let selectQuit: VoidClosure
    let selectCatalog: InputClosure<FiltersProvider>
  }
  enum Item {
    case category(title: String)
    case subcategory(title: String, imageURL: String)
    case empty(title: String)
    case seeAll
  }
  enum ProductItem {
    case category(filterID: Int, category: HomeResponse.Datas.Category)
    case subCategory(filterID: Int, subCategory: HomeResponse.Datas.Category.SubCategory)
    case emptyCategory(filterID: Int, category: HomeResponse.Datas.Category)
    case seeAll
  }
  // MARK: - Inputs
  func viewDidLoad() {
    repository.requestHome(configuration: homeConfiguration) { [weak self] result in
      switch result {
      case .success(let homeResponse):
        self?.merchantInfos?(MerchantInfos(response: homeResponse))
        self?.productItems = HomeViewModel.initializeItems(from: homeResponse)
        self?.thematicName = homeResponse.datas?.metas?.name
        if let home = Home(response: homeResponse) {
          self?.analytics.send(event: TrackEventHome.viewSaleHomepage(home: home, isThematic: true).mktAnalyticsEvent)
        }
      case .failure(let homeError):
        self?.handleHomeError(error: homeError)
      }
    }
  }
  private func handleHomeError(error: HomeError) {
    self.displayedError?(
      dialogAlertFactory.makeDataSource(
        for: error,
        onValid: { [weak self] in self?.actions.selectQuit() }
      )
    )
  }
  func didSelectItem(at index: Int) {
    guard productItems.indices.contains(index) else { return }
    let productItem = self.productItems[index]
    switch productItem {
    case .category(let filterID, let productCategory):
      if HomeViewModel.isSubCategory(at: index, productItems: self.productItems) {
        self.productItems = HomeViewModel.removeSubCategories(from: self.productItems)
      } else {
        guard let subCategories = productCategory.subCategories else { return }
        self.productItems = HomeViewModel.insert(subcategories: subCategories, at: index, for: self.productItems, with: filterID)
      }
    case .emptyCategory(let filterID, category: let category):
      guard let categoryFilter = CategoryFilter(with: filterID, category: category) else { return }
      actions.selectCatalog(.fromSelected(filters: [categoryFilter]))
    case .subCategory(let filterID, subCategory: let subCategory):
      guard let subCategoryFilter = CategoryFilter(with: filterID, category: subCategory) else { return }
      actions.selectCatalog(.fromSelected(filters: [subCategoryFilter]))
    case .seeAll: break
    }
  }
  func didSelectAllProducts() {
    actions.selectCatalog(.noFilters())
  }
  func didSelectCart() {
    repository.requestCart { [weak self] isEmpty in
      isEmpty ? self?.actions.displayEmptyCartAlert() : self?.actions.selectCart()
    }
  }
  func didSelectClose() {
    actions.selectQuit()
  }
  func didHideNavigation(state: Bool) {
    if state {
      titleText?(thematicName.orEmpty)
      hideNavigation?(false)
    } else {
      titleText?("")
      hideNavigation?(true)
    }
  }
  // MARK: - Helper
  private class func initializeItems(from response: HomeResponse) -> [ProductItem] {
    guard let filterID = response.datas?.metas?.filterID, let categories = response.datas?.categories else { return [] }
    return categories.map { (category) -> ProductItem in
      if let subCategories = category.subCategories, !subCategories.isEmpty {
        return .category(filterID: filterID,
                 category: category)
      } else {
        return .emptyCategory(filterID: filterID,
                   category: category)
      }
    } + [.seeAll]
  }
  private class func isSubCategory(at index: Int, productItems: [ProductItem]) -> Bool {
    if index + 1 < productItems.endIndex, case .subCategory = productItems[safe: index + 1] {
      return true
    }
    return false
  }
  private class func removeSubCategories(from productItems: [ProductItem]) -> [ProductItem] {
    return productItems.filter { (item) -> Bool in
      if case .subCategory = item {
        return false
      }
      return true
    }
  }
  private class func insert(subcategories: [HomeResponse.Datas.Category.SubCategory], at index: Int, for productItems: [ProductItem], with filterID: Int) -> [ProductItem] {
    let startSlice = productItems[0...index]
    var endSlice: ArraySlice<ProductItem> = []
    if index + 1 < productItems.count {
      endSlice = productItems[index+1...productItems.endIndex - 1]
    }
    let subCategories = subcategories.map { ProductItem.subCategory(filterID: filterID, subCategory: $0) }
    return HomeViewModel.removeSubCategories(from: Array(startSlice)) + subCategories + HomeViewModel.removeSubCategories(from: Array(endSlice))
  }
}
extension HomeViewModel.Item {
  fileprivate init(productItem: HomeViewModel.ProductItem, translator: TranslatorType) {
    switch productItem {
    case .category(filterID: _, category: let category):
      self = .category(title: category.name.orEmpty)
    case .subCategory(filterID: _, subCategory: let subCategory):
      self = .subcategory(title: subCategory.name.orEmpty, imageURL: subCategory.imageUrl.orEmpty)
    case .emptyCategory(filterID: _, category: let category):
      self = .empty(title: category.name.orEmpty)
    case .seeAll:
      self = .seeAll
    }
  }
}
extension HomeViewModel.Item: Equatable {
  public static func == (lhs: HomeViewModel.Item, rhs: HomeViewModel.Item) -> Bool {
    switch (lhs, rhs) {
    case let (.category(t1), .category(t2)):
      return t1 == t2
    case let (.subcategory(t1, i1), .subcategory(t2, i2)):
      return t1 == t2 && i1 == i2
    case let (.empty(t1), .empty(t2)):
      return t1 == t2
    case (.seeAll, .seeAll):
      return true
    default:
      return false
    }
  }
}
private extension Home {
  init?(response: HomeResponse) {
    guard
      let metas = response.datas?.metas,
      let id = metas.id,
      let name = metas.name,
      let filterID = metas.filterID,
      let sectorType = metas.sectorType,
      let merchantNames = metas.merchantNames,
      let brandNames = metas.brandNames else { return nil}
    self.id = id
    self.coverUrl = metas.coverURL.flatMap { URL(string: $0) }
    self.logoUrl = metas.logoURL.flatMap { URL(string: $0) }
    self.name = name
    self.filterId = filterID
    self.categories = []
    self.sectorType = SectorType(rawValue: sectorType) ?? .deco
    self.merchantNames = merchantNames
    self.brandNames = brandNames
    self.headerBanner = nil // Deprecated
  }
}
