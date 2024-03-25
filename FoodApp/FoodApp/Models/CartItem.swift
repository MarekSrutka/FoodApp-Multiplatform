//
//  CartItem.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: String
    let title: String
    let name: String
    let price: Decimal
    
    init(_ item: any MenuItem) {
        self.id = "\(item.name)_\(item.title)"
        self.title = item.title
        self.name = item.name
        self.price = item.price
    }
}
