//
//  Stock.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Stock: NSObject, NSCoding {
    let stockOfKey = "stockOf"
    private var changedIndex: Int?
    private var changedBeverageObjectIdentifier: ObjectIdentifier?
    private(set) var stockOf: [ObjectIdentifier: Beverages] {
        didSet {
            postNotification()
        }
    }
    
    override init() {
        stockOf = [:]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(stockOf, forKey: stockOfKey)
    }
    
    required init?(coder: NSCoder) {
        guard let stockOf = coder.decodeObject(forKey: stockOfKey) as? [ObjectIdentifier: Beverages] else {
            self.stockOf = [:]; return
        }
        self.stockOf = stockOf
    }
    
    func postNotification() {
        guard let objectIdentifier = changedBeverageObjectIdentifier, let changedBeverages = stockOf[objectIdentifier] else { return }
        NotificationCenter.default.post(name: .StockNumberDidChange,
                                        object: nil,
                                        userInfo: ["changedIndex": changedIndex!,
                                                   "numberOfBeverage": changedBeverages.beverages.count])
    }
    
    func numberOf(_ beverage: Beverage) -> Int {
        let beverages = stockOf[beverage.objectIdentifier()] ?? Beverages()
        return beverages.beverages.count
    }
    
    func dequeue(beverage: Beverage, in index: Int) -> Beverage {
        changedIndex = index
        changedBeverageObjectIdentifier = beverage.objectIdentifier()
        return stockOf[beverage.objectIdentifier()]!.dequeue()
    }
    
    func enqueue(beverage: Beverage, in index: Int) {
        changedIndex = index
        changedBeverageObjectIdentifier = beverage.objectIdentifier()
        let beverages = stockOf[beverage.objectIdentifier()] ?? Beverages()
        beverages.enqueue(beverage: beverage)
        stockOf[beverage.objectIdentifier()] = beverages
    }
}
