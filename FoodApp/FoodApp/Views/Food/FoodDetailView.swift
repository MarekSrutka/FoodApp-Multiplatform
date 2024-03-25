//
//  FoodDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct FoodDetailView: View {
    let food: Food
    var body: some View {
        List {
            Section {
                LabeledContent("Icon", value: food.name)
                LabeledContent("Name", value: food.title)
                LabeledContent {
                    Text(food.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? "")
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
                        let countVw = Text("x\(ingredients.count)").font(.footnote)
                        Text("\(countVw) Ingredients")
                    }
                    
                    if let allergies = food.allergies {
                        let countVw = Text("x\(allergies.count)").font(.footnote)
                        Text("\(countVw) Allergies")
                    }
                }
            }
            
            if let places = food.locations {
                Section("Locations") {
                    Button("See all locations") {
                        // TODO: push to mapView
                    }
                }
            }
        }
        .navigationTitle(food.title)
    }
}

#Preview {
    FoodDetailView(food: foods[0])
}
