//
//  Slot.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Slot: CustomStringConvertible {
    
    private var items: [Beverage]
    var itemCount: Int {
        return items.count
    }
    private var firstItem: Beverage? {
        return items.first
    }
    var description: String {
        guard let firstItemName = firstItem?.name else {
            return "Empty Slot"
        }
        return firstItemName
    }
    
    init(items: [Beverage]) {
        self.items = items
    }
    
    convenience init() {
        self.init(items: [])
    }
    
    func stock(_ item: Beverage) {
        if item == firstItem || items.isEmpty {
            items.append(item)
        }
    }
    
    func isCheaper(than price: Int) -> Bool {
        if let slotPrice = firstItem?.price {
            return slotPrice <= price
        } else {
            return false
        }
    }
    
    func compareName(with name: String) -> Bool {
        return !items.isEmpty ? firstItem?.name == name : false
    }
    
    func dropFirstItem(named name: String) -> Beverage? {
        return !items.isEmpty ? items.removeFirst() : nil
    }
    
    func getExpiredItems() -> [Beverage] {
        return items.filter {
            $0.validate(with: Date())
        }
    }
}
