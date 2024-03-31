//
//  ProductFetcherViewModel.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import Foundation

let products = [
    MenuSection(name: "Foods", items: foods),
    MenuSection(name: "Drinks", items: drinks),
    MenuSection(name: "Desserts", items: desserts)
]

@MainActor
final class ProductFetcherViewModel: ObservableObject {
    
    enum Action {
        case loading
        case finished(items: [MenuSection])
    }
    
    @Published private(set) var action: Action?
    
    func fetchProducts() async {
        guard action == nil else {
            return
        }
        
        action = .loading
        
        let duration = UInt64(2 * 1_000_000_000)
        try? await Task.sleep(nanoseconds: duration)
        
        action = .finished(items: products)
    }
    
    func fetchProduct(by id: String) async -> (any MenuItem)? {
        let duration = UInt64(0.5 * 1_000_000_000)
        try? await Task.sleep(nanoseconds: duration)
        
        let item = products
            .flatMap { $0.items }
            .first(where: { $0.id == id })
        
        return item
    }
    
    func getItems(in category: MenuCategory?) -> [any MenuItem]? {
        
        guard case let .finished(data) = action,
              let category else {
            return []
        }
        
        switch category {
        case .foods:
            return data.first { $0.items.allSatisfy { $0 is Food } }?.items
        case .drinks:
            return data.first { $0.items.allSatisfy { $0 is Drink } }?.items
        case .desserts:
            return data.first { $0.items.allSatisfy { $0 is Dessert } }?.items
        }
    }
    
    func getCategory(for item: any MenuItem) -> MenuCategory? {
        switch item {
        case is Food:
            return .foods
        case is Drink:
            return .drinks
        case is Dessert:
            return .desserts
        default:
            return nil
        }
    }
}
