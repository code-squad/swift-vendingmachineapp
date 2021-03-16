//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drinks: NSObject, NSCoding {
    private var drinks: [Drink] = [] {
        didSet {
            NotificationCenter.default.post(name: VendingMachine.updatedDrinkStock, object: self, userInfo: nil)
        }
    }
    
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

    func remove(drink: Drink.Type) {
        if let index = drinks.firstIndex(where: {ObjectIdentifier(type(of: $0)) == ObjectIdentifier(drink)}) {
            drinks.remove(at: index)
        }
    }
    
    func getAllDrinks() -> [ObjectIdentifier: [Drink]] {
        var stock: [ObjectIdentifier: [Drink]] = [:]
        stock = drinks.reduce(into: [:]) { dict, drink in
            let objectIdentifier = ObjectIdentifier(type(of: drink))
            dict[objectIdentifier, default: []].append(drink)
        }
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
