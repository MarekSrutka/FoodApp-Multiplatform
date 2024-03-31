//
//  SidebarView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var selectedCategory: MenuCategory?
    
    var body: some View {
        List(MenuCategory.allCases, selection: $selectedCategory) { category in
            NavigationLink(value: category) {
                Label(category.title, systemImage: category.systemImage)
            }
        }
    }
}

#Preview {
    NavigationSplitView {
        SidebarView(selectedCategory: .constant(.foods))
    } detail: {
        Text("Some content goes here")
    }
}
