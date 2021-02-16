//
//  Drinks.swift
//  drinksRevisited
//
//  Created by Luat on 1/29/21.
//

import Foundation

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
