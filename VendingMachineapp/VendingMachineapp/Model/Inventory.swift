//
//  Inventory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/25.
//
enum InventoryError: Error {
    case empty
}
import Foundation

class Inventory {
    
    private var inventory: [Beverage] = []
    
    func addBeverage(beverage: Beverage) {
        inventory.append(beverage)
    }
    
    func subtractBeverage(beverage: Beverage) -> Beverage? {
        let temp: Beverage
        do {
            temp = try inventory.remove(at: searchBeverage(beverage: beverage))
            return temp
        }
        catch {
            print(error)
        }
        return nil
    }
    
    func searchBeverage(beverage: Beverage) throws -> Int {
        guard let index = inventory.firstIndex(of: beverage) else {
            throw InventoryError.empty
        }
        return index
    }
    
    func eachBeverage(handler: (Beverage) -> ()) {
        inventory.forEach({ (beverage) in
            handler(beverage)
        })
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        let list = inventory.map({$0}).reduce(into: [:]) { counts, name in
            counts[name, default: 0] += 1
        }
        return list
    }
}
