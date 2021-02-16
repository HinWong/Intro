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
    
    enum CodingKeys: String, CodingKey {
        case drinkName = "strDrink"
        case thumbnail = "strDrinkThumb"
        case idDrink, strInstructions,strIngredient1, strIngredient2,strMeasure1,strMeasure2
    }
    
    let drinkName: String
    let thumbnail: String
    let idDrink: String
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strMeasure1: String?
    let strMeasure2: String?
}
