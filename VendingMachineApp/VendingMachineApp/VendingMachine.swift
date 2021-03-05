//
//  BeverageSKU.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class VendingMachine {
    
    private var inventoryList = [Beverage]()
    
    public func addToInventory(beverage: Beverage) {
        inventoryList.append(beverage)
    }
    
    public func printInventoryList() {
        inventoryList.forEach( { print($0) } )
    }
    
}
