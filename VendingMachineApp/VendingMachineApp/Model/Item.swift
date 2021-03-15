//
//  Item.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/15.
//

import Foundation

class Item: NSObject, NSCoding {
    var beverage: Beverage
    var count: Int
    
    init(beverage: Beverage, count: Int) {
        self.beverage = beverage
        self.count = count
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverage, forKey: "beverage")
        coder.encode(count, forKey: "count")
    }
    
    required init?(coder: NSCoder) {
        self.beverage = coder.decodeObject(forKey: "beverage") as! Beverage
        self.count = coder.decodeInteger(forKey: "count")
    }
    
    public func increaseCount(by amount: Int) {
        self.count += amount
    }
}
