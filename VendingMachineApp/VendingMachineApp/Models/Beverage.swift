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
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(volume, forKey: "volume")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(calorie, forKey: "calorie")
        coder.encode(imageName, forKey: "imageName")
        coder.encode(manufactured, forKey: "manufactured")
        coder.encode(expiredAfter, forKey: "expiredAfter")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.volume = coder.decodeInteger(forKey: "volume")
        self.price = coder.decodeInteger(forKey: "price")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.calorie = coder.decodeInteger(forKey: "calorie")
        self.imageName = coder.decodeObject(forKey: "imageName") as! String
        self.manufactured = coder.decodeObject(forKey: "manufactured") as! Date?
        self.expiredAfter = coder.decodeObject(forKey: "expiredAfter") as! Date?
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
