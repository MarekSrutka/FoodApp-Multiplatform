//
//  DessertDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct DessertDetailView: View {
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
                        let countVw = Text("x\(ingredients.count)").font(.footnote)
                        Text("\(countVw) Ingredients")
                    }
                    
                    if let allergies = dessert.allergies {
                        let countVw = Text("x\(allergies.count)").font(.footnote)
                        Text("\(countVw) Allergies")
                    }
                }
            }
            
            if let places = dessert.locations {
                Section("Locations") {
                    Button("See all locations") {
                        // TODO: push to mapView
                    }
                }
            }
        }
        .navigationTitle(dessert.title)
    }
}

#Preview {
    DessertDetailView(dessert: desserts[0])
}
