//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drinks {
    private var drinks: [Drink: Int] = [:]
    
    func add(drink: Drink) {
        drinks[drink] = (drinks[drink] ?? 0) + 1
    }
    
    func getAvailableDrinks(with coins: Int) -> [Drink] {
        let availableDrinks = drinks.keys.filter { (drink: Drink) -> Bool in
            return drink.price <= coins
        }
        return availableDrinks
    }
    
    func remove(drink: Drink) {
        drinks[drink] = (drinks[drink] ?? 0) - 1
    }
    
    func getAllDrinks() -> [Drink: Int] {
        return drinks
    }
    
    func getExpiredDrinks(date: Date) -> [Drink: Int] {
        let expiredDrinks = drinks.filter {
            return $0.key.validateExpiredAt(with: date)
        }
        return expiredDrinks
    }
    
    func getHotDrinks(for temperture: Int) -> [Drink] {
        let hotDrinks = drinks.keys.filter {
            return $0.isHot(with: temperture)
        }
        return hotDrinks
    }
}
