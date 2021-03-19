//
//  Order.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/04.
//

import Foundation

class Order: NSObject, NSCoding, FeaturedImageHavable {
    private let purchasedAt: Date
    private let item: Product
    
    init(purchasedAt: Date, item: Product) {
        self.purchasedAt = purchasedAt
        self.item = item
    }
    
    struct PropertyKey {
        static let purchasedAtKey = "purchasedAt"
        static let itemKey = "item"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(purchasedAt, forKey: PropertyKey.purchasedAtKey)
        coder.encode(item, forKey: PropertyKey.itemKey)
    }
    
    required init?(coder: NSCoder) {
        self.purchasedAt = coder.decodeObject(forKey: PropertyKey.purchasedAtKey) as? Date ?? Date()
        self.item = coder.decodeObject(forKey: PropertyKey.itemKey) as? Product ?? DenmarkStrawberryMilkFactory().createProduct(manufactured: Date(), expiredAfter: Date())
    }
    
    func getPackagingInfo() -> String? {
        return item.packaging
    }
}
