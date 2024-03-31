//
//  ShoppingCartViewModel.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

final class ShoppingCartViewModel: ObservableObject {
    
    @Published private(set) var items: [CartItem] = []
    @Published private(set) var promo: Promo?
    
    func add(_ item: any MenuItem) {
        items.append(CartItem(item))
    }
    
    func remove(id: String) {
        items.removeAll(where: { $0.id == id })
    }
    
    func getGroupedCart() -> [CartItem: Int] {
        var itemCounts = [CartItem: Int]()
        for item in items {
            itemCounts[item, default: 0] += 1
        }
        return itemCounts
    }
    
    func getTotal() -> Decimal {
        let total = items.reduce(0) { $0 + $1.price }
        guard let discount = promo?.pct else { return total }
        
        return total - (discount * total)
    }
    
    func set(promo: Promo) {
        self.promo = promo
    }
    
    func removePromo() {
        self.promo = nil
    }
}
