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
    
    @Binding var layoutExperience: LayoutExperienceSettings?
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad ||
            UIDevice.current.userInterfaceIdiom == .mac {
            MenuSplitView(layoutExperience: $layoutExperience)
                .toolbar(.hidden, for: .tabBar)
        } else {
            MenuStackView()
        }
     
    }
}

#Preview {
    MenuView(layoutExperience: .constant(.twoColumn))
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
        .environmentObject(ProductFetcherViewModel())
}
