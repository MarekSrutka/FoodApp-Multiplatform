//
//  App+Ext.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI

extension FoodAppApp {
    func handleDeeplink(from url: URL) async {
        let routeFinder = RouteFinder()
        if let route = await routeFinder.find(from: url, productFetcher: fetcher) {
            
            switch route {
            case .menuItem(let item, _):
                let category = fetcher.getCategory(for: item)
                routerManager.selectedCategory = category
                routerManager.selectedItemId = item.id
            default:
                routerManager.selectedCategory = MenuCategory.allCases.first
            }
            
            routerManager.push(to: route)
        }
    }
}
