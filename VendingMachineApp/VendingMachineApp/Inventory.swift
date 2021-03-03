//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Inventory {
    private let numberOfProductTypes: Int
    private let slots: [Slot]
    
    init(numberOfProductTypes: Int) {
        self.numberOfProductTypes = numberOfProductTypes
        self.slots = (0..<numberOfProductTypes).map { _ in Slot() }
    }
    
    func add(_ item: Beverage, at slotNumber: Int) {
        slots.enumerated().forEach { (index, slot) in
            if index == slotNumber - 1 {
                slot.stock(item)
            }
        }
    }
    
    func showItems(handler: (Slot) -> ()) {
        return self.slots.forEach {
            handler($0)
        }
    }
}
