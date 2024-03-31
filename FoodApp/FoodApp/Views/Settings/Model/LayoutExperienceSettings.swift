//
//  LayoutExperienceSettings.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import Foundation

enum LayoutExperienceSettings: Int, Identifiable, CaseIterable, Equatable {
    
    var id: Int { rawValue }
    
    case twoColumn
    case threeColumn
    
    var imageName: String {
        switch self {
        case .twoColumn:
            return "sidebar.left"
        case .threeColumn:
            return "rectangle.split.3x1"
        }
    }
    
    var title: String {
        switch self {
        case .twoColumn:
            return "Two Column"
        case .threeColumn:
            return "Three Column"
        }
    }
    
    var description: String {
        switch self {
        case .twoColumn:
            return "Presents views in two columns: sidebar and detail."
        case .threeColumn:
            return "Presents view in three columns: sidebar, content, and detail."
        }
    }
}
