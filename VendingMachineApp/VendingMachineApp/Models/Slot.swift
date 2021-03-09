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
    var itemImageName: String? {
        return firstItem?.imageName
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
        if let firstItem = firstItem {
            if item.name == firstItem.name {
                items.append(item)
            }
        } else {
            items.append(item)
        }
    }
    
    func isSameOrCheaper(than price: Int) -> Bool {
        if let slotPrice = firstItem?.price {
            return slotPrice <= price
        } else {
            return false
        }
    }
    
    func compareName(with name: String) -> Bool {
        return !items.isEmpty ? firstItem?.name == name : false
    }
    
    func dropFirstItem() -> Beverage? {
        return !items.isEmpty ? items.removeFirst() : nil
    }
    
    func getExpiredItems() -> [Beverage] {
        return items.filter {
            !$0.isStillEdible(at: Date())
        }
    }
    
    func isHotDrinkSlot() -> Bool {
        return items.first { $0 is HotServable && ($0 as! HotServable).isHotter(than: 50) } != nil
    }
}
