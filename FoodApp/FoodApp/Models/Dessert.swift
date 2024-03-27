//
//  Dessert.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

struct Dessert: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isCold: Bool
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
    let locations: [Location]?
}

let desserts: [Dessert] = [
    
    Dessert(name: "🍦",
            title: "Ice Cream",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            isCold: true,
            price: 20.59,
            ingredients: [
                Ingredient(name: "Ingredient 1", quantity: 10),
                Ingredient(name: "Ingredient 2", quantity: 5),
                Ingredient(name: "Ingredient 3", quantity: 5)
            ],
            allergies: [
                Allergie(name: "Allergie 1"),
                Allergie(name: "Allergie 2"),
                Allergie(name: "Allergie 3")
            ],
            locations: [
                Location(name: "Location 1",
                         lat: 48.85970, long: 16.05400),
                Location(name: "Location 2",
                         lat: 48.852243, long: 16.052229),
                Location(name: "Location 3",
                         lat: 48.860560, long: 16.058882),
                Location(name: "Location 4",
                         lat: 48.864270, long: 16.040329)
             ]),
    Dessert(name: "🍩",
            title: "Doughnut",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            isCold: false,
            price: 16.99,
            ingredients: [
                Ingredient(name: "Ingredient 1", quantity: 10),
                Ingredient(name: "Ingredient 2", quantity: 5),
                Ingredient(name: "Ingredient 3", quantity: 5)
            ],
            allergies: [
                Allergie(name: "Allergie 1"),
                Allergie(name: "Allergie 2"),
                Allergie(name: "Allergie 3")
            ],
            locations: [
                Location(name: "Location 1",
                         lat: 48.85970, long: 16.05400),
                Location(name: "Location 2",
                         lat: 48.852243, long: 16.052229),
                Location(name: "Location 3",
                         lat: 48.860560, long: 16.058882),
                Location(name: "Location 4",
                         lat: 48.864270, long: 16.040329)
             ])
]
