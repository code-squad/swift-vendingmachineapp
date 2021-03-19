//
//  Product.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import Foundation

class Product: NSObject, NSCoding {
    private(set) var brand: String
    private(set) var beverage: Beverage
    private(set) var name: String
    private(set) var price: Int
    private(set) var packaging: String
    
    init(brand: String, beverage: Beverage, name: String, price: Int, packaging: String) {
        self.brand = brand
        self.beverage = beverage
        self.name = name
        self.price = price
        self.packaging = packaging
    }
    
    struct PropertyKey {
        static let brandKey = "brand"
        static let beverageKey = "beverage"
        static let nameKey = "name"
        static let priceKey = "price"
        static let packagingKey = "packaging"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: PropertyKey.brandKey)
        coder.encode(beverage, forKey: PropertyKey.beverageKey)
        coder.encode(name, forKey: PropertyKey.nameKey)
        coder.encode(price, forKey: PropertyKey.priceKey)
        coder.encode(packaging, forKey: PropertyKey.packagingKey)
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: PropertyKey.brandKey) as? String ?? ""
        self.beverage = coder.decodeObject(forKey: PropertyKey.beverageKey) as? Beverage ?? DenmarkStrawberryMilkFactory().createProduct(manufactured: Date(), expiredAfter: Date()).beverage
        self.name = coder.decodeObject(forKey: PropertyKey.nameKey) as? String ?? ""
        self.price = coder.decodeInteger(forKey: PropertyKey.priceKey)
        self.packaging = coder.decodeObject(forKey: PropertyKey.packagingKey) as? String ?? ""
    }
    
    func isStillEdible(at date: Date) -> Bool {
        return beverage.isStillEdible(at: date)
    }
    
    public override func isEqual(_ other: Any?) -> Bool {
        guard let other = other as? Product else { return false }
        return self.brand == other.brand && self.beverage == other.beverage && self.name == other.name && self.price == other.price && self.packaging == other.packaging
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(brand)
        hasher.combine(beverage)
        hasher.combine(name)
        hasher.combine(price)
        hasher.combine(packaging)
        return hasher.finalize()
    }
    
    func isFromSameFactory(with product: Product) -> Bool {
        self.beverage.isSameBeverageType(with: product.beverage) && self.brand == product.brand && self.name == product.name && self.price == product.price && self.packaging == product.packaging
    }
}
