//
//  DessertDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct DessertDetailView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    let dessert: Dessert
    
    var body: some View {
        List {
            Section {
                LabeledContent("Icon", value: dessert.name)
                LabeledContent("Name", value: dessert.title)
                LabeledContent {
                    Text(dessert.price,
                         format: .currency(code: "CZK")
                    )
                } label: {
                    Text("Price")
                }
                LabeledContent("Cold?", value: dessert.isCold ? "✅" : "❌")
            }
            
            Section("Description") {
                Text(dessert.description)
            }
            
            if dessert.allergies?.isEmpty == false ||
                dessert.ingredients?.isEmpty == false {
                
                Section("Dietry") {
                    if let ingredients = dessert.ingredients {
                        NavigationLink(value: Route.ingredients(items: ingredients)) {
                            let countVw = Text("x\(ingredients.count)").font(.footnote)
                            Text("\(countVw) Ingredients")
                        }
                    }
                    
                    if let allergies = dessert.allergies {
                        NavigationLink(value: Route.allergies(items: allergies)) {
                            let countVw = Text("x\(allergies.count)").font(.footnote)
                            Text("\(countVw) Allergies")
                        }
                    }
                }
            }
            
            if dessert.locations?.isEmpty == false {
                Section("Locations") {
                    Button("See all locations") {
                        routerManager.push(to: .map(item: dessert))
                    }
                }
            }
            
            Section {
                Button {
                    cartViewModel.add(dessert)
                    routerManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(dessert.title)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if let deeplink = Route.buildDeeplink(from: .menuItem(item: dessert)) {
                    ShareLink(item: deeplink) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    DessertDetailView(dessert: desserts[0])
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
}
