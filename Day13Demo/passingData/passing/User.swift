//
//  User.swift
//  passing
//
//  Created by Luat on 1/28/21.
//

import Foundation

/// Model: holds data, business logic, single source of truth
struct User {
    var name: String
    var drinksBought: Int {
        didSet {
            if drinksBought % 5 == 0 && drinksBought > 0{
                bonusEarned += 1
            }
        }
    }
    var bonusEarned = 0
    
    mutating func buyOneDrink() {
        drinksBought += 1
    }
    
    mutating func redeemBonusDrink() {
        if bonusEarned > 0 {
            print("redeeming drink")
            bonusEarned -= 1
        } else {
            print("bonus not available")
        }
    }
    
}

