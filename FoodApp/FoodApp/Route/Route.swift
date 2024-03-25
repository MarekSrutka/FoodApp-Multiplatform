//
//  Route.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation
import SwiftUI

enum Route {
    case menuItem(item: any MenuItem)
    case cart
}

extension Route: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.menuItem(let lhsItem), .menuItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.cart, .cart):
            return true
        default:
            return false
        }
    }
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .menuItem(item: let item):
            switch item {
                
            case is Food:
                FoodDetailView(food: item as! Food)
            case is Drink:
                DrinkDetailView(drink: item as! Drink)
            case is Dessert:
                DessertDetailView(dessert: item as! Dessert)
            default:
                EmptyView()
            }
        case .cart:
            CartView()
        }
    }
}

