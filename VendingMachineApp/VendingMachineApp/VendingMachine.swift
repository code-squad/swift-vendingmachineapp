//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private let numberOfSlots: Int
    private var inventory: Inventory
    private var moneyDeposited: Int = 0
    
    private var soldItems: [Date : Beverage] = [:]
    
    init(numberOfSlots: Int) {
        self.numberOfSlots = numberOfSlots
        self.inventory = Inventory(numberOfProductTypes: numberOfSlots)
    }
    
    mutating func insertMoney(amount: Int) {
        moneyDeposited += amount
    }
    
    func add(item: Beverage, slotNumber: Int) {
        inventory.add(item, at: slotNumber)
    }
    
    func showPurchasableItemsWithDeposit() -> [Slot] {
        var purchasableItems: [Slot] = []
        inventory.showItems {
            if $0.isCheaper(than: moneyDeposited) {
                purchasableItems.append($0)
            }
        }
        return purchasableItems
    }
}
