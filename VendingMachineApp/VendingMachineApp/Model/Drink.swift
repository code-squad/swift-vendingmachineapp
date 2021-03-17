//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Drink: CustomStringConvertible, Hashable, NSCoding {
    
    var description: String {
        return "\(brand), \(volume)ml, \(charge)원, \(name), \(manufacturing.convertToString())"
    }
    
    private let brand: String
    private let volume: Int
    private let charge: Int
    private (set) var name: String
    private (set) var manufacturing: Date
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date) {
        self.brand = brand
        self.volume = volume
        self.charge = charge
        self.name = name
        self.manufacturing = manufacturing
    }
    
    convenience required init() {
        self.init(brand: "class", volume : 0, charge: 0, name : "Drink", manufacturing: Date.init())
    }
    
    required init?(coder: NSCoder) {
        brand = coder.decodeObject(forKey: "brand") as! String
        volume = coder.decodeInteger(forKey: "volume")
        charge = coder.decodeInteger(forKey: "charge")
        name = coder.decodeObject(forKey: "name") as! String
        manufacturing = coder.decodeObject(forKey: "brand") as! Date
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(volume, forKey: "volume")
        coder.encode(charge, forKey: "charge")
        coder.encode(name, forKey: "name")
        coder.encode(manufacturing, forKey: "manufacturing")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.brand)
        hasher.combine(self.charge)
        hasher.combine(self.manufacturing)
        hasher.combine(self.name)
        hasher.combine(self.volume)
    }
    
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.brand == rhs.brand &&
            lhs.charge == rhs.charge &&
            lhs.manufacturing == rhs.manufacturing &&
            lhs.name == rhs.name &&
            lhs.volume == lhs.volume
    }
    
    func canBuy(have money : Int) -> Bool {
        return self.charge < money
    }
    
    func isSameType(with productType: Drink.Type) -> Bool {
        return type(of: self) == productType
    }
    
    func payFor() -> Int {
        return charge
    }
}
