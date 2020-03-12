//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Beverage: NSObject, NSCoding {

    private var manufacturer: String
    private var brand: String
    private var capacity: Int
    private(set) var price: Money
    private var name: String
    private var manufacturedDate: Date
    private var expirationDate: Date
    private var temperature: Int
    
    override var description: String {
        return "\(manufacturer), \(capacity), \(price), \(brand), \(manufacturedDate.dateToString())"
    }

    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, temperature: Int) {
        self.manufacturer = manufacturer
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate.setPastDate()
        self.temperature = temperature
    }
    
    required init?(coder: NSCoder) {
        guard let manufacturer = coder.decodeObject(forKey: "manufacturer") as? String else { return nil }
        guard let brand = coder.decodeObject(forKey: "brand") as? String else { return nil }
        guard let price = coder.decodeObject(forKey: "price") as? Money else { return nil }
        guard let name = coder.decodeObject(forKey: "name") as? String else { return nil }
        guard let manufacturedDate = coder.decodeObject(forKey: "manufacturedDate") as? Date else { return nil }
        guard let expirationDate = coder.decodeObject(forKey: "expirationDate") as? Date else { return nil }
        
        self.manufacturer = manufacturer
        self.brand = brand
        self.capacity = coder.decodeInteger(forKey: "capacity")
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate
        self.temperature = coder.decodeInteger(forKey: "temperature")
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.manufacturer, forKey: "manufacturer")
        coder.encode(self.brand, forKey: "brand")
        coder.encode(self.capacity, forKey: "capacity")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.manufacturedDate, forKey: "manufacturedDate")
        coder.encode(self.expirationDate, forKey: "expirationDate")
        coder.encode(self.temperature, forKey: "temperature")
    }
    
    func verifyHotBeverage() -> Bool {
        return temperature > 65 ? true : false 
    }
    
    func isExpiratedBeverage() -> Bool {
        let now = Date()
       return now > expirationDate ? true : false
    }

   static func == (lhs: Beverage, rhs: Beverage) -> Bool {
       return lhs.hashValue == rhs.hashValue
   }
       
}
