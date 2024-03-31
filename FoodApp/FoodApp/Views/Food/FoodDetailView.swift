//
//  FoodDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct FoodDetailView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    let food: Food
    
    var body: some View {
        List {
            Section {
                LabeledContent("Icon", value: food.name)
                LabeledContent("Name", value: food.title)
                LabeledContent {
                    Text(food.price,
                         format: .currency(code: "CZK")
                    )
                } label: {
                    Text("Price")
                }
            }
            
            Section("Description") {
                Text(food.description)
            }
            
            if food.allergies?.isEmpty == false ||
                food.ingredients?.isEmpty == false {
                
                Section("Dietry") {
                    if let ingredients = food.ingredients {
                        NavigationLink(value: Route.ingredients(items: ingredients)) {
                            let countVw = Text("x\(ingredients.count)").font(.footnote)
                            Text("\(countVw) Ingredients")
                        }
                    }
                    
                    if let allergies = food.allergies {
                        NavigationLink(value: Route.allergies(items: allergies)) {
                            let countVw = Text("x\(allergies.count)").font(.footnote)
                            Text("\(countVw) Allergies")
                        }
                    }
                }
            }
            
            if food.locations?.isEmpty == false {
                Section("Locations") {
                    Button("See all locations") {
                        routerManager.push(to: .map(item: food))
                    }
                }
            }
            
            Section {
                Button {
                    cartViewModel.add(food)
                    routerManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(food.title)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if let deeplink = Route.buildDeeplink(from: .menuItem(item: food)) {
                    ShareLink(item: deeplink) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FoodDetailView(food: foods[0])
            .environmentObject(NavigationRouter())
            .environmentObject(ShoppingCartViewModel())
    }

}
