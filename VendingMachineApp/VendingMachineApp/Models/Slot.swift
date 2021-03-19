//
//  Slot.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol FeaturedImageHavable {
    func getPackagingInfo() -> String?
}

class Slot: NSObject, NSCoding, FeaturedImageHavable {
    private var items: [Product]
    var itemCount: Int {
        return items.count
    }
    var firstItem: Product? {
        return items.first
    }
    override var description: String {
        guard let firstItemName = firstItem?.name else {
            return "Empty Slot"
        }
        return firstItemName
    }
    
    init(items: [Product]) {
        self.items = items
    }
    
    struct PropertyKey {
        static let itemsKey = "items"
    }
    
    convenience override init() {
        self.init(items: [])
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(items, forKey: PropertyKey.itemsKey)
    }
    
    required init?(coder: NSCoder) {
        self.items = coder.decodeObject(forKey: PropertyKey.itemsKey) as? [Product] ?? []
    }
    
    public override func isEqual(_ other: Any?) -> Bool {
        guard let other = other as? Slot else { return false }
        return self.items == other.items && self.itemCount == other.itemCount && self.firstItem == other.firstItem
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(items)
        hasher.combine(itemCount)
        hasher.combine(firstItem)
        return hasher.finalize()
    }
    
    func stock(_ item: Product) {
        items.append(item)
    }
    
    func isAffordable(at price: Int) -> Bool {
        if let slotPrice = firstItem?.price {
            return slotPrice <= price
        } else {
            return false
        }
    }
    
    func dropFirstItem() -> Product? {
        return !items.isEmpty ? items.removeFirst() : nil
    }
    
    func getExpiredItems(at date: Date) -> [Product] {
        return items.filter {
            !$0.isStillEdible(at: date)
        }
    }
    
    func isHotDrinkSlot() -> Bool {
        return items.first { $0.beverage is HotServable && ($0.beverage as! HotServable).isHotter(than: 50) } != nil
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func getPackagingInfo() -> String? {
        return firstItem?.packaging
    }
}
