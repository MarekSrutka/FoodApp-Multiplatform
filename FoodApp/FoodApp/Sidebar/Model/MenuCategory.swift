//
//  MenuCategory.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import Foundation

enum MenuCategory: Int, CaseIterable, Identifiable {
    case foods
    case drinks
    case desserts
    
    var id: Int { rawValue }
}

extension MenuCategory {
    
    var title: String {
        switch self {
        case .foods:
            return "Foods"
        case .drinks:
            return "Drinks"
        case .desserts:
            return "Desserts"
        }
    }
    
    var systemImage: String {
        switch self {
        case .foods:
            return "fork.knife"
        case .drinks:
            return "mug"
        case .desserts:
            return "birthday.cake"
        }
    }
}


