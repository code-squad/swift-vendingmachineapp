//
//  Stock.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Stock: NSObject, NSCoding {
    private var beverages: Beverages
    
    override init() {
        self.beverages = Beverages()
    }
    
    required init?(coder: NSCoder) {
        self.beverages = coder.decodeObject(forKey: .stockBeverages) as? Beverages ?? Beverages()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(object: beverages, forKey: .stockBeverages)
    }
    
    func postNotification() {
        NotificationCenter.default.post(name: .StockNumberDidChange,
                                        object: nil,
                                        userInfo: beverages.sortToDictionary())
    }
    
    func dictionary() -> [ObjectIdentifier: Beverages] {
        return beverages.sortToDictionary()
    }
    
    func numberOf(_ beverage: Beverage) -> Int {
        let dictionary = beverages.sortToDictionary()
        guard let count = dictionary[beverage.objectIdentifier()]?.count() else { return 0 }
        return count
    }
    
    func stockState() -> [ObjectIdentifier: Beverages] {
        beverages.sortToDictionary()
    }
    
    func dequeue(beverage: Beverage) -> Beverage? {
        guard let firstBeverage = beverages.firstBeverage(of: beverage) else { return nil }
        postNotification()
        return firstBeverage
    }
    
    func enqueue(beverage: Beverage) {
        beverages.enqueue(beverage: beverage)
        postNotification()
    }
}
