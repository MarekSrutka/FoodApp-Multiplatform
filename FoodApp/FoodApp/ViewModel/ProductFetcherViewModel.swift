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
    
}
