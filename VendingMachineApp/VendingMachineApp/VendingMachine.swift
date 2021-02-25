//
//  BeverageSKU.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class BeverageInventory {
    
    private var inventoryList = [Beverage]()
    
    public func addToInventory(beverage: Beverage) {
        inventoryList.append(beverage)
    }
    
    public func printInventoryList() {
        print(inventoryList)
    }
    
}
