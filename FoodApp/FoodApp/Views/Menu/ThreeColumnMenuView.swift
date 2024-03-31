//
//  ThreeColumnMenuView.swift
//  FoodApp
//
//  Created by Marek Srutka on 31.03.2024.
//

import SwiftUI

struct ThreeColumnMenuView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    @EnvironmentObject private var fetcher: ProductFetcherViewModel
    
    @Binding var showCart: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        NavigationSplitView {
            Group {
                switch fetcher.action {
                case .loading:
                    ProgressView()
                case .finished:
                    SidebarView(selectedCategory: $routerManager.selectedCategory)
                case .none:
                    EmptyView()
                }
            }
            .navigationTitle("Menu")
        } content: {
            ZStack {
                Group {
                    if let category = routerManager.selectedCategory {
                        let items = fetcher.getItems(in: category) ?? []
                        MenuListView(title: category.title, items: items)
                    } else {
                        Text("Choose a category")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                    
                    ToolbarItem(placement: .primaryAction) {
                        CartButton(count: cartViewModel.items.count) {
                            showCart.toggle()
                        }
                    }
                }
            }
        } detail: {
            NavigationStack(path: $routerManager.routes) {
                Group {
                    if let selectedItemId = routerManager.selectedItemId,
                       let selectedCategory = routerManager.selectedCategory,
                       let item = fetcher.getItems(in: selectedCategory)? .first(where: { $0.id == selectedItemId }) {
                        getView(for: item)
                    } else {
                        Text("Choose an item")
                    }
                }
                .navigationDestination(for: Route.self) { $0 }
            }
        }
    }
}

private extension ThreeColumnMenuView {
    @ViewBuilder
    func getView(for item: any MenuItem) -> some View {
        if let food = item as? Food {
            FoodDetailView(food: food)
        } else if let drink = item as? Drink {
            DrinkDetailView(drink: drink)
        } else if let dessert = item as? Dessert {
            DessertDetailView(dessert: dessert)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    ThreeColumnMenuView(showCart: .constant(false), showSettings: .constant(false))
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
        .environmentObject(ProductFetcherViewModel())
}
