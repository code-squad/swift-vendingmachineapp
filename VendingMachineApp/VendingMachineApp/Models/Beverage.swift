//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: NSObject, NSCoding, SafelyDrinkable {
    private(set) var brand: String
    private(set) var volume: Int
    private(set) var price: Int
    private(set) var name: String
    private let calorie: Int
    private(set) var imageName: String
    private let manufactured: Date?
    private let expiredAfter: Date?
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, imageName: String, manufactured: Date?, expiredAfter: Date?) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.calorie = calorie
        self.imageName = imageName
        self.manufactured = manufactured
        self.expiredAfter = expiredAfter
    }
    
    struct PropertyKey {
        static let brandKey = "brand"
        static let volumeKey = "volume"
        static let priceKey = "price"
        static let nameKey = "name"
        static let calorieKey = "calorie"
        static let imageNameKey = "imageName"
        static let manufacturedKey = "manufactured"
        static let expiredAfterKey = "expiredAfter"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: PropertyKey.brandKey)
        coder.encode(volume, forKey: PropertyKey.volumeKey)
        coder.encode(price, forKey: PropertyKey.priceKey)
        coder.encode(name, forKey: PropertyKey.nameKey)
        coder.encode(calorie, forKey: PropertyKey.calorieKey)
        coder.encode(imageName, forKey: PropertyKey.imageNameKey)
        coder.encode(manufactured, forKey: PropertyKey.manufacturedKey)
        coder.encode(expiredAfter, forKey: PropertyKey.expiredAfterKey)
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: PropertyKey.brandKey) as? String ?? ""
        self.volume = coder.decodeInteger(forKey: PropertyKey.volumeKey)
        self.price = coder.decodeInteger(forKey: PropertyKey.priceKey)
        self.name = coder.decodeObject(forKey: PropertyKey.nameKey) as? String ?? ""
        self.calorie = coder.decodeInteger(forKey: PropertyKey.calorieKey)
        self.imageName = coder.decodeObject(forKey: PropertyKey.imageNameKey) as? String ?? ""
        self.manufactured = coder.decodeObject(forKey: PropertyKey.manufacturedKey) as? Date ?? Date()
        self.expiredAfter = coder.decodeObject(forKey: PropertyKey.expiredAfterKey) as? Date ?? Date()
    }
    
    public override func isEqual(_ other: Any?) -> Bool {
        guard let other = other as? Beverage else { return false }
        return self.brand == other.brand && self.volume == other.volume && self.price == other.price && self.name == other.name && self.calorie == other.calorie && self.manufactured == other.manufactured && self.expiredAfter == other.expiredAfter
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(brand)
        hasher.combine(volume)
        hasher.combine(price)
        hasher.combine(name)
        hasher.combine(calorie)
        hasher.combine(imageName)
        hasher.combine(manufactured)
        hasher.combine(expiredAfter)
        return hasher.finalize()
    }
    
    func isStillEdible(at date: Date) -> Bool {
        if let expiredAfter = expiredAfter {
            return expiredAfter >= date
        }
        return false
    }
}
