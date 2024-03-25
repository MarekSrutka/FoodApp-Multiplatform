//
//  FoodItemView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct MenuItemView: View {
    let item: any MenuItem
    var body: some View {
        LabeledContent {
            Text(item.price,
                 format: .currency(code: "CZK")
            )
        } label: {
            Text("\(item.name) \(item.title)")
        }

    }
}

#Preview {
    MenuItemView(item: foods[0])
}
