//
//  CartButton.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct CartButton: View {
    
    let count: Int
    let didTap: () -> ()
    
    var body: some View {
        Button {
            didTap()
        } label: {
            Image(systemName: "cart")
                .symbolVariant(.fill)
                .padding(4)
        }
        .overlay(alignment: .topTrailing) {
            if count > 0 {
                badge
            }
        }
    }
}

private extension CartButton {
    
    var badge: some View {
        Text("\(count)")
            .foregroundStyle(.white)
            .padding(6)
            .font(.caption2.bold())
            .monospacedDigit()
            .background(
                Circle()
                    .fill(.red)
            )
            .offset(x: 2, y: -2)
    }
}

#Preview {
    Group {
        CartButton(count: 0) { }
        
        CartButton(count: 4) { }
    }
}

