//
//  ShoppingCartViewModel.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

final class ShoppingCartViewModel: ObservableObject {
    
    @Published private(set) var items: [CartItem] = []
    
    func add(_ item: any MenuItem) {
        items.append(CartItem(item))
    }
    
    func remove(id: String) {
        items.removeAll(where: { $0.id == id })
    }
}
