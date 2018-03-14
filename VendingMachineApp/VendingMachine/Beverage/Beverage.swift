//
//  Beverage.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    
    override var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(dateFormatter.string(from: self.date))"
    }

    private var brand: String = ""
    private var name: String = ""
    private var volume: Int = 0
    private (set) var price : Int = 0
    private var date: Date = Date()
    
    init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date) {
        self.brand = brand
        self.name = name
        self.volume = volume
        self.price = price
        self.date = manufacturedDate
    }
    
    override init() {
        self.brand = ""
        self.name = ""
        self.volume = 0
        self.price = 0
        self.date = Date()
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand, forKey: "brand")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(volume, forKey: "volume")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(date, forKey: "date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        guard let brand = aDecoder.decodeObject(forKey: "brand") as? String else { return }
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else { return }
        guard let date = aDecoder.decodeObject(forKey: "date") as? Date else { return }
        self.brand = brand
        self.name = name
        self.date = date
        self.volume = aDecoder.decodeInteger(forKey: "volume")
        self.price = aDecoder.decodeInteger(forKey: "price")
    }
    
    func getKind() -> ObjectIdentifier {
        return ObjectIdentifier(self)
    }

}
