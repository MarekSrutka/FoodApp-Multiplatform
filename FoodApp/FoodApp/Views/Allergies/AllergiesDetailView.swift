//
//  AllergiesDetailView.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI

struct AllergiesDetailView: View {
    let allergies: [Allergie]
    var body: some View {
        List {
            Section {
                ForEach(allergies, id: \.name) { allergy in
                    Text(allergy.name)
                }
            } footer: {
                Text("This item may contain traces of the following above")
            }
        }
        .navigationTitle("Allergies")
    }
}

#Preview {
    NavigationStack {
        AllergiesDetailView(allergies: foods[0].allergies!)
    }
    
}
