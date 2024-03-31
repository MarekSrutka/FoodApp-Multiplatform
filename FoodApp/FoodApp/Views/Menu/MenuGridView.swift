//
//  MenuGridView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct MenuGridView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    let title: String
    let items: [any MenuItem]
    
    private var column: [GridItem] {
        [ GridItem(.adaptive(minimum: 200), spacing: 32) ]
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column, spacing: 32) {
                ForEach(items, id: \.id) { item in
                    let route = routerManager.getRoute(for: item)
                    NavigationLink(value: route) {
                        MenuCardView(item: item) { item in
                            cartViewModel.add(item)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .scenePadding()
        }
        .navigationTitle(title)
        .navigationDestination(for: Route.self) { $0 }
    }
}

#Preview {
    NavigationStack {
        MenuGridView(title: "Foods", items: foods)
            .environmentObject(NavigationRouter())
    }
}
