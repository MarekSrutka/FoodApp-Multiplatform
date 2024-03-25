//
//  ContentView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(foods) { food in
                    NavigationLink {
                        FoodDetailView(food: food)
                    } label: {
                        FoodItemView(food: food)
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    ContentView()
}
