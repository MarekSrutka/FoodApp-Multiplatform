//
//  ContentView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    @EnvironmentObject private var fetcher: ProductFetcherViewModel
    
    var body: some View {
        NavigationStack(path: $routerManager.routes) {
            Group {
                switch fetcher.action {
                case .loading:
                    ProgressView()
                case .finished(let items):
                    List {
                        ForEach(items, id: \.name) { section in
                            Section(section.name) {
                                ForEach(section.items, id: \.id) { item in
                                    let route = getRoute(for: item)
                                    NavigationLink(value: route) {
                                        MenuItemView(item: item)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            CartButton(count: cartViewModel.items.count) {
                                routerManager.push(to: .cart)
                            }
                        }
                    }
                case .none:
                    EmptyView()
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: Route.self) { $0 }
        }
        .task {
            await fetcher.fetchProducts()
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
        .environmentObject(ProductFetcherViewModel())
}
