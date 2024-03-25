//
//  DrinkDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct DrinkDetailView: View {
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
                        let countVw = Text("x\(ingredients.count)").font(.footnote)
                        Text("\(countVw) Ingredients")
                    }
                    
                    if let allergies = drink.allergies {
                        let countVw = Text("x\(allergies.count)").font(.footnote)
                        Text("\(countVw) Allergies")
                    }
                }
            }
            
            if let places = drink.locations {
                Section("Locations") {
                    Button("See all locations") {
                        // TODO: push to mapView
                    }
                }
            }
            
            Section {
                Button {
                    cartViewModel.add(drink)
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }
        }
        .navigationTitle(drink.title)
    }
}

#Preview {
    DrinkDetailView(drink: drinks[0])
}
