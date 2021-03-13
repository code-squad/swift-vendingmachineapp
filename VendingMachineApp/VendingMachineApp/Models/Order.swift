//
//  Order.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/04.
//

import Foundation

class Order: NSObject, NSCoding {
    private let purchased: Date
    private let item: Beverage
    
    init(purchased: Date, item: Beverage) {
        self.purchased = purchased
        self.item = item
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(purchased, forKey: "purchased")
        coder.encode(item, forKey: "item")
    }
    
    required init?(coder: NSCoder) {
        self.purchased = coder.decodeObject(forKey: "purchased") as! Date
        self.item = coder.decodeObject(forKey: "item") as! Beverage
    }
}
