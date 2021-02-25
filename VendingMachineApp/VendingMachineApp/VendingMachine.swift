//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class VendingMachine: CustomStringConvertible {
    
    var description: String {
        return "\(milkInventory)\n\(sodaInventory)\n\(coffeeInventory)"
    }
    
    private var milkInventory: [Milk]
    private var sodaInventory: [Soda]
    private var coffeeInventory: [Coffee]
 
    init() {
        milkInventory = []
        sodaInventory = []
        coffeeInventory = []
    }
    
    public func appendMilk(kindOfMilk: Milk) {
        self.milkInventory.append(kindOfMilk)
    }
    
    public func appendCoffe(kindOfCoffe: Coffee) {
        self.coffeeInventory.append(kindOfCoffe)
    }
    
    public func appendSoda(kindOfSoda: Soda) {
        self.sodaInventory.append(kindOfSoda)
    }
}
