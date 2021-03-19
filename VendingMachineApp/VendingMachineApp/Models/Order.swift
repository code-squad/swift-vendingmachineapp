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
    var itemImageName: String {
        return item.imageName
    }
    
    init(purchased: Date, item: Beverage) {
        self.purchased = purchased
        self.item = item
    }
    
    struct PropertyKey {
        static let purchasedKey = "purchased"
        static let itemKey = "item"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(purchased, forKey: PropertyKey.purchasedKey)
        coder.encode(item, forKey: PropertyKey.itemKey)
    }
    
    required init?(coder: NSCoder) {
        self.purchased = coder.decodeObject(forKey: PropertyKey.purchasedKey) as? Date ?? Date()
        self.item = coder.decodeObject(forKey: PropertyKey.itemKey) as? Beverage ?? DenmarkStrawberryMilkFactory().createProduct(manufactured: Date(), expiredAfter: Date())
    }
}
