//
//  IngredientsDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI

struct IngredientsDetailView: View {
    let ingredients: [Ingredient]
    var body: some View {
        List(ingredients, id: \.name) { ingredient in
            LabeledContent {
                Text(ingredient.quantity / 100, format: .percent)
            } label: {
                Text(ingredient.name)
            }
        }
        .navigationTitle("Ingredients")
    }
}

#Preview {
    NavigationStack {
        IngredientsDetailView(ingredients: foods[0].ingredients!)
    }
    
}
