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
    
    typealias SlotIndex = Int
    typealias ItemQuantity = Int
    
    init(slots: [Slot]) {
        self.slots = slots
    }
    
    convenience init(numberOfSlots: Int) {
        self.init(slots: (0..<numberOfSlots).map { _ in Slot() })
    }
    
    func add(_ item: Beverage, at slotNumber: Int) {
        enumerateSlots { (index, slot) in
            if index == slotNumber - 1 {
                slot.stock(item)
            }
        }
    }
    
    func showSlots(handler: (Slot) -> ()) {
        return slots.forEach {
            handler($0)
        }
    }
    
    func enumerateSlots(handler: (Int, Slot) -> ()) {
        return slots.enumerated().forEach { (index, slot) in
            handler(index, slot)
        }
    }
    
    func takeStock() -> [SlotIndex : (Slot, ItemQuantity)] {
        var inventoryDictionary: [SlotIndex : (Slot, ItemQuantity)] = [:]
        enumerateSlots { (index, slot) in
            inventoryDictionary[index + 1] = (slot, slot.itemCount)
        }
        return inventoryDictionary
    }
}
