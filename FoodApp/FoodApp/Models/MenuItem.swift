//
//  MenuItem.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

protocol MenuItem: Identifiable, Hashable {
    var name: String { get }
    var title: String { get }
    var description: String { get }
    var price: Decimal { get }
}
