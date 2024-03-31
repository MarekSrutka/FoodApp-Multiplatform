//
//  Route.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation
import SwiftUI

enum Route {
    case menuItem(item: any MenuItem, hideBar: Bool = true)
    case cart
    case ingredients(items: [Ingredient])
    case allergies(items: [Allergie])
    case map(item: any MenuItem, hideBar: Bool = true)
    case promo(data: Promo, hideBar: Bool = true)
    case invalidProduct(hideBar: Bool = true)
}

extension Route: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.menuItem(let lhsItem, _), .menuItem(let rhsItem, _)):
            return lhsItem.id == rhsItem.id
        case (.cart, .cart):
            return true
        case (.ingredients(let lhsItem), .ingredients(let rhsItem)):
            return lhsItem == rhsItem
        case (.allergies(let lhsItem), .allergies(let rhsItem)):
            return lhsItem == rhsItem
        case (.map(let lhsItem, _), .map(let rhsItem, _)):
            return lhsItem.id == rhsItem.id
        case (.promo, .promo):
            return true
        case (.invalidProduct, .invalidProduct):
            return true
        default:
            return false
        }
    }
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .menuItem(item: let item, let hideBar):
            Group {
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
            }
            .toolbar(hideBar ? .hidden : .visible, for: .tabBar)
        case .cart:
            CartView()
        case .ingredients(items: let items):
            IngredientsDetailView(ingredients: items)
        case .allergies(items: let items):
            AllergiesDetailView(allergies: items)
        case .map(item: let item, let hideBar):
            LocationMapView(item: item)
                .toolbar(hideBar ? .hidden : .visible, for: .tabBar)
        case .promo(let data, let hideBar):
            PromoView(data: data)
                .toolbar(hideBar ? .hidden : .visible, for: .tabBar)
        case .invalidProduct(let hideBar):
            InvalidProductView()
                .toolbar(hideBar ? .hidden : .visible, for: .tabBar)
        }
    }
}

extension Route {
    static func buildDeeplink(from route: Route) -> URL? {
        switch route {
        case .menuItem(let item, _):
            let queryProductItem = item.title.replacingOccurrences(of: " ", with: "+")
            let queryProductID = "\(item.name)_\(queryProductItem)"
            
            var url = URL(string: "marekFoodApp://product")!
            let queryItems = [URLQueryItem(name: "item", value: queryProductID)]
            
            url.append(queryItems: queryItems)
            
            return url
        default:
            return nil
        }
    }
}
