//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/25.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Beverages: NSObject, NSCoding {
    private(set) var beverages: [Beverage]
    
    override init() {
        beverages = []
    }
    
    required init?(coder: NSCoder) {
        self.beverages = coder.decodeObject(forKey: .beverages) as? [Beverage] ?? []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(object: beverages, forKey: .beverages)
    }
    
    func dequeue() -> Beverage {
        return beverages.removeFirst()
    }
    
    func enqueue(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func count() -> Int {
        return beverages.count
    }
    
    func firstBeverage(of beverage: Beverage) -> Beverage? {
        guard let index = beverages.firstIndex(of: beverage) else { return nil }
        beverages.remove(at: index)
        let firstBeverage = beverages[index]
        return firstBeverage
    }
    
    func sortToDictionary() -> [ObjectIdentifier: Beverages] {
        var dictionary: [ObjectIdentifier: Beverages] = [:]
        beverages.forEach { (beverage) in
            let identifier = beverage.objectIdentifier()
            let beverages = dictionary[identifier] ?? Beverages()
            beverages.enqueue(beverage: beverage)
            dictionary[identifier] = beverages
        }
        return dictionary
    }
}
