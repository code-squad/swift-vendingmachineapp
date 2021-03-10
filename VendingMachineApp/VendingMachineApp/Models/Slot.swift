//
//  Slot.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Slot: CustomStringConvertible, Hashable {
    static func == (lhs: Slot, rhs: Slot) -> Bool {
        return lhs.items == rhs.items && lhs.itemCount == rhs.itemCount && lhs.firstItem == rhs.firstItem && lhs.itemImageName == rhs.itemImageName
    }
    
    private var items: [Beverage]
    var itemCount: Int {
        return items.count
    }
    var firstItem: Beverage? {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(items)
        hasher.combine(itemCount)
        hasher.combine(firstItem)
        hasher.combine(itemImageName)
    }
    
    func stock(_ item: Beverage) {
        items.append(item)
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
