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
    
    let manufacturerString = "manufacturer"
    let brandString = "brand"
    let capacityString = "capacity"
    let priceString = "price"
    let nameString = "name"
    let manufacturedDateString = "manufacturedDate"
    let expirationDateString = "expirationDate"
    let temperatureString = "temperature"
    
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
        guard let manufacturer = coder.decodeObject(forKey: manufacturerString) as? String else { return nil }
        guard let brand = coder.decodeObject(forKey: brandString) as? String else { return nil }
        guard let price = coder.decodeObject(forKey: priceString) as? Money else { return nil }
        guard let name = coder.decodeObject(forKey: nameString) as? String else { return nil }
        guard let manufacturedDate = coder.decodeObject(forKey: manufacturedDateString) as? Date else { return nil }
        guard let expirationDate = coder.decodeObject(forKey: expirationDateString) as? Date else { return nil }
        
        self.manufacturer = manufacturer
        self.brand = brand
        self.capacity = coder.decodeInteger(forKey: capacityString)
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate
        self.temperature = coder.decodeInteger(forKey: temperatureString)
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.manufacturer, forKey: manufacturerString)
        coder.encode(self.brand, forKey: brandString)
        coder.encode(self.capacity, forKey: capacityString)
        coder.encode(self.price, forKey: priceString)
        coder.encode(self.name, forKey: nameString)
        coder.encode(self.manufacturedDate, forKey: manufacturedDateString)
        coder.encode(self.expirationDate, forKey: expirationDateString)
        coder.encode(self.temperature, forKey: temperatureString)
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
