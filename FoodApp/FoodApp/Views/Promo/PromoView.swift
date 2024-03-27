//
//  PromoView.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import SwiftUI

struct PromoView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    let data: Promo
    
    var body: some View {
        VStack {
            Text(data.pct, format: .percent)
                .padding(50)
                .font(.system(size: 60,
                              weight: .heavy,
                              design: .rounded))
                .background(
                    Circle().fill(.red)
                )
                .foregroundColor(.white)
            
            Text("Get this **Great Offer** 🔥🔥🔥")
                .font(.title2)
            Text(data.desc)
                .italic()
            
            Button("Apply Discount") {
                cartViewModel.set(promo: data)
                routerManager.replace(stack: [.cart])
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .padding(.top, 16)
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    PromoView(data: .init(desc: "enjoy this discount", pct: 0.2))
        .environmentObject(NavigationRouter())
        .environmentObject(ShoppingCartViewModel())
}
