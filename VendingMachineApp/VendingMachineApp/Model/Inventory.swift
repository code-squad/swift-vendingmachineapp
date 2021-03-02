//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/01.
//

import Foundation

class Inventory: CustomStringConvertible {
    
    var description: String {
        return "\(milkInventory)일, \(sodaInventory)이, \(coffeeInventory)삼"
    }
    
    private var milkInventory: [Milk]
    private var sodaInventory: [Soda]
    private var coffeeInventory: [Coffee]
    
    init() {
        milkInventory = []
        sodaInventory = []
        coffeeInventory = []
    }
    
    public func appendBeverage(beverage: Beverage) {
        
        switch beverage {
        case is Milk:
            milkInventory.append(MilkFactory().create() as! Milk)
        case is Soda:
            sodaInventory.append(SodaFactory().create() as! Soda)
        case is Coffee:
            coffeeInventory.append(CoffeeFactory().create() as! Coffee)
        default:
            break
        }
    }
}
