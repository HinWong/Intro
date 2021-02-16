//
//  Drinks.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import Foundation

//{
//    "drinks": [
//    {
//    "strDrink": "3-Mile Long Island Iced Tea",
//    "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
//    "idDrink": "15300"
//    }
//}

struct Drinks: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}
