//
//  ContentView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cartViewModel = ShoppingCartViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Foods") {
                    ForEach(foods) { food in
                        NavigationLink(value: food) {
                            MenuItemView(item: food)
                        }
                    }
                }
                
                Section("Drinks") {
                    ForEach(drinks) { drink in
                        NavigationLink(value: drink) {
                            MenuItemView(item: drink)
                        }
                    }
                }
                
                Section("Desserts") {
                    ForEach(desserts) { dessert in
                        NavigationLink(value: dessert) {
                            MenuItemView(item: dessert)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
            .navigationDestination(for: Food.self) { item in
                FoodDetailView(food: item)
                    .environmentObject(cartViewModel)
            }
            .navigationDestination(for: Drink.self) { item in
                DrinkDetailView(drink: item)
                    .environmentObject(cartViewModel)
            }
            .navigationDestination(for: Dessert.self) { item in
                DessertDetailView(dessert: item)
                    .environmentObject(cartViewModel)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CartButton(count: cartViewModel.items.count) {
                        
                    }
                }
            }
        }
        .environmentObject(cartViewModel)
    }
}

#Preview {
    ContentView()
}
