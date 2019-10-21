//
//  Storage.swift
//  VendingMachine
//
//  Created by CHOMINJI on 23/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias InventoryInfo = ([ItemInfo]) -> Void

class Storage: NSObject, NSCoding {
    private var inventory: [ObjectIdentifier: Item] = [:]
    private var objectIDs: [ObjectIdentifier] {
        return Array(inventory.keys)
    }
    var count: Int {
        return inventory.count
    }
    var beverages: [Item] {
        return Array(inventory.values)
    }
    
    enum Keys: String {
        case inventory = "Inventory"
        case items = "Items"
    }
    
    func encode(with coder: NSCoder) {
        let items = Array(inventory.values)
        coder.encode(items, forKey: Keys.items.rawValue)
    }
    
    override init() { }
    
    init(allBeverages: [[Beverage]]) {
        for beverages in allBeverages {
            let item = Item(beverages: beverages)
            if let beverage = item.fetchFirst() {
                inventory[beverage.objectID] = item
            }
        }
    }
    
    required init?(coder: NSCoder) {
        let items = coder.decodeObject(forKey: Keys.items.rawValue) as! [Item]
        let decodedInventory = items.reduce(into: [ObjectIdentifier: Item]()) { (inventory, item) in
            if let representBeverage = item.representBeverage {
                let itemType = type(of: representBeverage)
                let objectID = ObjectIdentifier(itemType)
                inventory[objectID] = item
            }
        }
        self.inventory = decodedInventory
    }
    
    func append(_ beverage: Beverage, count: Int = 0) {
        let items = findItems(key: beverage.objectID)
        items.append(beverage: beverage, count: count)
    }
    
    func remove(_ beverage: Beverage, count: Int = 0) {
        let items = findItems(key: beverage.objectID)
        for _ in 0..<count {
            items.remove(beverage: beverage)
        }
    }
    
    func filter(by condition: Item.Condition) -> [Beverage] {
        return inventory.values
            .map { $0.filter(by: condition) }
            .reduce(into: [Beverage]()) { $0.append(contentsOf: $1) }
    }
    
    func fetchBeverage(at index: Int) -> Beverage? {
        guard index > -1 && index < objectIDs.endIndex else {
            return nil
        }
        let id = objectIDs[index]
        let item = findItems(key: id)
        return item.fetchFirst()
    }
    
    func findItems(key objectID: ObjectIdentifier) -> Item {
        guard let oldItem = inventory[objectID] else {
            let newItem = Item()
            inventory[objectID] = newItem
            return newItem
        }
        return oldItem
    }
    
}

// MARK: - Show Methods

extension Storage {
    /// 모든 재고 리스트를 보여준다.
    func showAllList(with show: InventoryInfo) {
        let bundle = inventory.values
            .compactMap { $0.info }
        show(bundle)
    }
}
