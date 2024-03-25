//
//  CartView.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cartViewModel: ShoppingCartViewModel
    
    var body: some View {
        List {
            let items = cartViewModel.getGroupedCart()
            ForEach(items.keys.sorted(by: { $0.title < $1.title })) { key in
                let count = items[key]!
                LabeledContent {
                    let price = key.price * Decimal(count)
                    Text(price, format: .currency(code: "CZK"))
                } label: {
                    let multiplierVw = Text("x\(count)").font(.footnote).bold()
                    Text("\(multiplierVw) \(key.name) \(key.title)")
                }
                .swipeActions {
                    Button(role: .destructive) {
                        cartViewModel.remove(id: key.id)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
            
            Section {
                LabeledContent {
                    Text(cartViewModel.getTotal(), format: .currency(code: "CZK")).bold()
                } label: {
                    Text("Total")
                }
            }
        }
        .navigationTitle("Basket")
    }
}

struct CartView_Previews: PreviewProvider {
    
    static var previews: some View {
        let vm = ShoppingCartViewModel()
        NavigationStack {
            CartView()
                .environmentObject(ShoppingCartViewModel())
                .onAppear {
                    for food in foods {
                        vm.add(food)
                    }
                }
        }
    }
}
