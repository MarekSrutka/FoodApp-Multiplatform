//
//  InvalidProductView.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI

struct InvalidProductView: View {
    var body: some View {
        VStack {
            Text("😱")
                .font(.system(size: 100))
            Text("Invalid Product")
                .font(.largeTitle)
                .bold()
            Text("Looks like that item doesn't exist anymore")
        }
    }
}

#Preview {
    InvalidProductView()
}
