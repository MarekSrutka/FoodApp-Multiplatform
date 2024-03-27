//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

@main
struct FoodAppApp: App {
    
    @StateObject var routerManager = NavigationRouter()
    @StateObject var cartViewModel = ShoppingCartViewModel()
    @StateObject var fetcher = ProductFetcherViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(routerManager)
                .environmentObject(cartViewModel)
                .environmentObject(fetcher)
                .onOpenURL { url in
                    Task {
                        await handleDeeplink(from: url)
                    }
                }
        }
    }
}
