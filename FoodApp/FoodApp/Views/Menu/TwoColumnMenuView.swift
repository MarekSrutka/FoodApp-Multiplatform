//
//  TwoColumnMenuView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct TwoColumnMenuView: View {
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
        } detail: {
            if let category = routerManager.selectedCategory {
                let items = fetcher.getItems(in: category) ?? []
                NavigationStack(path: $routerManager.routes) {
                    MenuGridView(title: category.title, items: items)
                }
            } else {
                Text("Choose a category")
            }
        }
    }
}

#Preview {
    TwoColumnMenuView(showCart: .constant(false), showSettings: .constant(false))
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
        .environmentObject(ProductFetcherViewModel())
}
