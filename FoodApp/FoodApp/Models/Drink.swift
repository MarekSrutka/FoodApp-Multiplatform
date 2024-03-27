//
//  Drink.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

struct Drink: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isFizzy: Bool
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
    let locations: [Location]?
}

let drinks: [Drink] = [
    Drink(name: "🥤",
          title: "Soda",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: true,
          price: 99.99,
          ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: nil,
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
    Drink(name: "🧋",
          title: "Boba Tea",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 34.99,
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
    Drink(name: "🧃",
          title: "Juice",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 24.99,
          ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: nil,
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
