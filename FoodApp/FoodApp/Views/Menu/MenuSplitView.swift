//
//  MenuSplitView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct MenuSplitView: View {
    @EnvironmentObject private var fetcher: ProductFetcherViewModel
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    @State private var showCart: Bool = false
    @State private var showSettings: Bool = false
    
    @Binding var layoutExperience: LayoutExperienceSettings?
    
    var body: some View {
        Group {
            switch layoutExperience {
            case .threeColumn:
                ThreeColumnMenuView(showCart: $showCart, showSettings: $showSettings)
            default:
                TwoColumnMenuView(showCart: $showCart, showSettings: $showSettings)
            }
        }
        .sheet(isPresented: $showCart){
            NavigationStack {
                CartView()
            }
            .environmentObject(cartViewModel)
        }
        .sheet(isPresented: $showSettings) {
            NavigationStack {
                SettingsView(layoutExperience: $layoutExperience)
            }
        }
        .task {
            await fetcher.fetchProducts()
        }
    }
}

#Preview {
    NavigationSplitView {
        MenuSplitView(layoutExperience: .constant(.twoColumn))
            .environmentObject(ProductFetcherViewModel())
    } detail: {
        Text("Detail")
    }


}
