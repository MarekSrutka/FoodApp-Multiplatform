//
//  MenuListView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    
    let title: String
    let items: [any MenuItem]
    
    var body: some View {
        List(items, id: \.id, selection: $routerManager.selectedItemId) { item in
            let route = routerManager.getRoute(for: item)
            NavigationLink(value: route) {
                MenuItemView(item: item)
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    MenuListView(title: "Foods", items: foods)
        .environmentObject(NavigationRouter())
}
