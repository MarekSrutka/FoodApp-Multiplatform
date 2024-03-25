//
//  ContentView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var cartViewModel = ShoppingCartViewModel()
    @StateObject private var routerManager = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $routerManager.routes) {
            List {
                Section("Foods") {
                    ForEach(foods) { food in
                        NavigationLink(value: Route.menuItem(item: food)) {
                            MenuItemView(item: food)
                        }
                    }
                }
                
                Section("Drinks") {
                    ForEach(drinks) { drink in
                        NavigationLink(value: Route.menuItem(item: drink)) {
                            MenuItemView(item: drink)
                        }
                    }
                }
                
                Section("Desserts") {
                    ForEach(desserts) { dessert in
                        NavigationLink(value: Route.menuItem(item: dessert)) {
                            MenuItemView(item: dessert)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CartButton(count: cartViewModel.items.count) {
                        routerManager.push(to: .cart)
                    }
                }
            }
            .navigationDestination(for: Route.self) { $0 }
        }
        .environmentObject(cartViewModel)
        .environmentObject(routerManager)
    }
}

#Preview {
    MenuView()
}
