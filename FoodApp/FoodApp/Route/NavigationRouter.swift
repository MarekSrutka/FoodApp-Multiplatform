//
//  NavigationRoute.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var routes = [Route]()
    @Published var selectedCategory: MenuCategory?
    @Published var selectedItemId: String?
    
    func push(to screen: Route) {
        guard !routes.contains(screen) else {
            return
        }
        
        routes.append(screen)
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    func reset() {
        routes = []
    }
    
    func replace(stack: [Route]) {
        routes = stack
    }
    
    func getRoute(for item: any MenuItem) -> Route? {
        switch item {
        case is Food:
            return Route.menuItem(item: item as! Food)
        case is Drink:
            return Route.menuItem(item: item as! Drink)
        case is Dessert:
            return Route.menuItem(item: item as! Dessert)
        default:
            return nil
        }
    }
}
