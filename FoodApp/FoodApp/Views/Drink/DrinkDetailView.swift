//
//  DrinkDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct DrinkDetailView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    let drink: Drink
    
    var body: some View {
        List {
            Section {
                LabeledContent("Icon", value: drink.name)
                LabeledContent("Name", value: drink.title)
                LabeledContent {
                    Text(drink.price,
                         format: .currency(code: "CZK")
                    )
                } label: {
                    Text("Price")
                }
                LabeledContent("Fizzy?", value: drink.isFizzy ? "✅" : "❌")
            }
            
            Section("Description") {
                Text(drink.description)
            }
            
            if drink.allergies?.isEmpty == false ||
                drink.ingredients?.isEmpty == false {
                
                Section("Dietry") {
                    if let ingredients = drink.ingredients {
                        NavigationLink(value: Route.ingredients(items: ingredients)) {
                            let countVw = Text("x\(ingredients.count)").font(.footnote)
                            Text("\(countVw) Ingredients")
                        }
                    }
                    
                    if let allergies = drink.allergies {
                        NavigationLink(value: Route.allergies(items: allergies)) {
                            let countVw = Text("x\(allergies.count)").font(.footnote)
                            Text("\(countVw) Allergies")
                        }
                    }
                }
            }
            
            if drink.locations?.isEmpty == false {
                Section("Locations") {
                    Button("See all locations") {
                        routerManager.push(to: .map(item: drink))
                    }
                }
            }
            
            Section {
                Button {
                    cartViewModel.add(drink)
                    routerManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(drink.title)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if let deeplink = Route.buildDeeplink(from: .menuItem(item: drink)) {
                    ShareLink(item: deeplink) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    DrinkDetailView(drink: drinks[0])
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
}
