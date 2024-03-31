//
//  MenuCardView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct MenuCardView: View {
    
    let item: any MenuItem
    let didTappAdd: (_ item: any MenuItem) -> Void
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.system(size: 100))
                .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .overlay(alignment: .bottom) {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.system(.headline, design: .rounded, weight: .bold))
                    Text(item.price, format: .currency(code: "CZK"))
                        .font(.caption)
                }
                Spacer()
                Button("Add") {
                    didTappAdd(item)
                }
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            .padding(8)
            .background(.ultraThinMaterial)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 3)
    }
}

#Preview {
    MenuCardView(item: foods[1]) { _ in }
}
