//
//  FoodItemView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct FoodItemView: View {
    let food: Food
    var body: some View {
        LabeledContent {
            Text(food.price,
                 format: .currency(code: Locale.current.currency?.identifier ?? ""))
        } label: {
            Text("\(food.name) \(food.title)")
        }

    }
}

#Preview {
    FoodItemView(food: foods[0])
}
