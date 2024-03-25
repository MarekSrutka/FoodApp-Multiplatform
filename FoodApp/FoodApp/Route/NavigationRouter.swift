//
//  NavigationRoute.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var routes = [Route]()
    
    func push(to screen: Route) {
        routes.append(screen)
    }
    
    func reset() {
        routes = []
    }
}
