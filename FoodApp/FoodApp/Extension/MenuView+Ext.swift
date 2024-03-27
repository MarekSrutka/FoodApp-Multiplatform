//
//  MenuView+Ext.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI

extension MenuView {
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
