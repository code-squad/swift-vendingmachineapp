//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김성현 on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Inventory: NSObject, NSCoding {
    
    private var storage = [String: BeverageItem]()
    
    override init() {
        super.init()
    }
    
    //MARK: NSCoding
    
    struct PropertyKey {
        static let storage = "storage"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(storage, forKey: PropertyKey.storage)
    }
    
    required init?(coder: NSCoder) {
        guard let storage = coder.decodeObject(forKey: PropertyKey.storage) as? [String: BeverageItem] else {
            return nil
        }
        self.storage = storage
    }
    
    var allBeverages: [BeverageItem] {
        return Array(storage.values)
    }
    
    subscript(name: String) -> BeverageItem? {
        return storage[name]
    }
    
    func addBeverageItem(_ item: BeverageItem) {
        if storage[item.name] == nil {
            storage[item.name] = item
        }
    }
    
    func addBeverage(_ beverage: Beverage, to item: BeverageItem) {
        addBeverageItem(item)
        self[item.name]!.addBeverage(beverage)
    }
    
    var expiredBeverages: [String: [Beverage]] {
        return storage.mapValues { $0.expiredBeverages }
    }
    
    var hotBeverages: [String: [Beverage]] {
        return storage.mapValues { $0.hotBeverages }
    }
    
}
