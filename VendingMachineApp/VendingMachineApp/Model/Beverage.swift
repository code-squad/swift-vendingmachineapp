//
//  Beverage.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    var kindOf: String
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var manufactureDate: Date
    var imageName: String
    override init() {
        kindOf = ""
        brand = ""
        weight = 0
        price = 0
        name = ""
        manufactureDate = Date()
        imageName = ""
    }
    
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, imageName: String) {
        self.kindOf = "음료"
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactureDate = manufactureDate.addingTimeInterval(21600)
        self.imageName = imageName
    }
    required init?(coder aDecoder: NSCoder) {
        kindOf = aDecoder.decodeObject(forKey: "kindOf") as? String ?? ""
        brand = aDecoder.decodeObject(forKey: "brand") as? String ?? ""
        weight = aDecoder.decodeInteger(forKey: "weight")
        price = aDecoder.decodeInteger(forKey: "price")
        name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
        manufactureDate = aDecoder.decodeObject(forKey: "manufactureDate") as? Date ?? Date()
        imageName = (aDecoder.decodeObject(forKey: "imageName") as? String) ?? ""
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(kindOf, forKey: "kindOf")
        aCoder.encode(brand, forKey: "brand")
        aCoder.encode(weight, forKey: "weight")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(manufactureDate, forKey: "manufactureDate")
        aCoder.encode(imageName, forKey: "imageName")
    }
    override var description: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd"
        let manufactureDateByFormat = dateFormat.string(from: self.manufactureDate as Date)
        return "\(self.brand), \(self.weight)ml, \(self.price)원, \(self.name), \(manufactureDateByFormat)"
    }
    
}
