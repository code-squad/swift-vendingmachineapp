//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Inventory {
    private let slots: [Slot]
    var slotCount: Int {
        return slots.count
    }
    
    typealias ItemQuantity = Int
    
    init(slots: [Slot]) {
        self.slots = slots
    }
    
    convenience init(numberOfSlots: Int) {
        self.init(slots: (0..<numberOfSlots).map { _ in Slot() })
    }
    
    func add(_ item: Beverage) {
        if let slot = slots.first(where: { $0.compareName(with: item.name) }) {
            slot.stock(item)
        } else {
            slots.first { $0.itemCount == 0 }?.stock(item)
        }
    }
    
    func showSlots(handler: (Slot) -> ()) {
        return slots.forEach {
            handler($0)
        }
    }
    
    func filterHotDrinks() -> [Slot] {
        slots.filter {
            $0.isHotDrinkSlot()
        }
    }
    
    func takeStock() -> [Slot : ItemQuantity] {
        var inventoryDictionary: [Slot : ItemQuantity] = [:]
        slots.forEach {
            inventoryDictionary[$0] = $0.itemCount
        }
        return inventoryDictionary
    }
}
