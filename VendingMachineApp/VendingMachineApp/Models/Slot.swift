//
//  Slot.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Slot: NSObject, NSCoding {
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
    override var description: String {
        guard let firstItemName = firstItem?.name else {
            return "Empty Slot"
        }
        return firstItemName
    }
    
    init(items: [Beverage]) {
        self.items = items
    }
    
    convenience override init() {
        self.init(items: [])
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(items, forKey: "items")
    }
    
    required init?(coder: NSCoder) {
        self.items = coder.decodeObject(forKey: "items") as! [Beverage]
    }
    
    public override func isEqual(_ other: Any?) -> Bool {
        guard let other = other as? Slot else { return false }
        return self.items == other.items && self.itemCount == other.itemCount && self.firstItem == other.firstItem && self.itemImageName == other.itemImageName
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(items)
        hasher.combine(itemCount)
        hasher.combine(firstItem)
        hasher.combine(itemImageName)
        return hasher.finalize()
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
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}
