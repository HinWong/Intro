//
//  CellViewModel.swift
//  drinksRevisited
//
//  Created by Luat on 1/29/21.
//

import Foundation

class CellViewModel {
    private var drink: Drink
    
    init(drink: Drink) {
        self.drink = drink
    }
    
    func drinkName() -> String {
        return drink.drinkName
    }
    
    func imageURL() -> URL {
        guard let url = URL(string: drink.thumbnail) else {
            return URL(string: "https://www.google.com")!
        }
        return url
    }
}
