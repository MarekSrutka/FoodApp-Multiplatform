//
//  Food.swift
//  FoodApp
//
//  Created by Marek Srutka on 25.03.2024.
//

import Foundation

struct Food: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
    let locations: [Location]?
}

let foods: [Food] = [
    Food(name: "🌯",
         title: "Burrito",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 135.00,
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
    Food(name: "🍜",
         title: "Ramen",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 100.00,
         ingredients: [
            Ingredient(name: "Ingredient 2", quantity: 20),
            Ingredient(name: "Ingredient 3", quantity: 11),
            Ingredient(name: "Ingredient 4", quantity: 15)
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
    Food(name: "🍔",
         title: "Burger",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 125.00,
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
    Food(name: "🍕",
         title: "Pizza",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 190.00,
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
    Food(name: "🌭",
         title: "Hotdog",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 80.00,
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
    Food(name: "🧆",
         title: "Falafel",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 110.00,
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
    Food(name: "🍝",
         title: "Spag Bol",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 200.00,
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

struct Ingredient: Hashable {
    let name: String
    let quantity: Double
}

struct Allergie: Hashable {
    let name: String
}

struct Location: Identifiable, Hashable {
    var id: String { name }
    let name: String
    let lat: Double
    let long: Double
}
