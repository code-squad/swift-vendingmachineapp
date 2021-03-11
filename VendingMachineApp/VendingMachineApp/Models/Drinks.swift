//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drinks: NSObject, NSCoding {
    private var stock: [ObjectIdentifier: [Drink]] = [:]
    private var drinks: [Drink] = []
    
    override var description: String {
        return "\(drinks)"
    }

    override init() {}
    
    required init?(coder: NSCoder) {
        self.drinks = coder.decodeObject(forKey: "drinks") as! [Drink]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "drinks")
    }
    
    func add(drink: Drink) {
        drinks.append(drink)
    }
    
    func getAvailableDrinks(with coins: Int) -> [Drink] {
        let availableDrinks = drinks.filter {
            return $0.price <= coins
        }
        return availableDrinks
    }

    func remove(drink: Drink) {        
        if let index = drinks.firstIndex(of: drink) {
            drinks.remove(at: index)
        }
    }
    
    func getAllDrinks() -> [ObjectIdentifier: [Drink]] {
        return stock
    }
    
    func getExpiredDrinks(date: Date) -> [Drink] {
        let expiredDrinks = drinks.filter {
            return $0.validateExpiredAt(with: date)
        }
        return expiredDrinks
    }

    func getHotDrinks(for temperture: Int) -> [Drink] {
        let hotDrinks = drinks.filter {
            return $0.isHot(with: temperture)
        }
        return hotDrinks
    }
}
