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
    case ingredients(items: [Ingredient])
    case allergies(items: [Allergie])
    case map(item: any MenuItem)
    case promo(data: Promo)
    case invalidProduct
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
        case (.ingredients(let lhsItem), .ingredients(let rhsItem)):
            return lhsItem == rhsItem
        case (.allergies(let lhsItem), .allergies(let rhsItem)):
            return lhsItem == rhsItem
        case (.map(let lhsItem), .map(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.promo(let lhsItem), .promo(let rhsItem)):
            return lhsItem == rhsItem
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
        case .ingredients(items: let items):
            IngredientsDetailView(ingredients: items)
        case .allergies(items: let items):
            AllergiesDetailView(allergies: items)
        case .map(item: let item):
            LocationMapView(item: item)
        case .promo(let data):
            PromoView(data: data)
        case .invalidProduct:
            InvalidProductView()
        }
    }
}

extension Route {
    static func buildDeeplink(from route: Route) -> URL? {
        switch route {
        case .menuItem(let item):
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
