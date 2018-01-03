//
//  File.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

protocol BeverageCheck {
    func validate(with: Date) -> Bool
    func isHot() -> Bool
}

class Beverage: NSObject, NSCoding, NSCopying {
    private var brand: String = ""
    private var volume: Int = 0
    private (set) var price: Int = 0
    private (set) var temperature: Double = 0
    private (set) var name: String = ""
    private (set) var manufacturingDate: Date = Date()
    override var hashValue: Int {
        return name.hashValue
    }
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? Beverage else { return false }
        return self.name == other.name
    }
    override var description: String {
        let date = DateFormatter()
        date.dateFormat = "yyyyMMdd"
        return "\(brand), \(volume)ml, \(price)원, \(name), \(date.string(from: manufacturingDate))"
    }
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date, temperature: Double) {
        super.init()
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.temperature = temperature
        self.manufacturingDate = Date(timeInterval: DateInterval.today.rawValue, since: manufacturingDate)
    }
    convenience override init() {
        self.init(brand: "", volume: 0, price: 0, name: "", manufacturingDate: Date(), temperature: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init()
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else { return }
        guard let brand = aDecoder.decodeObject(forKey: "brand") as? String else { return }
        guard let manufacturingDate = aDecoder.decodeObject(forKey: "manufacturingDate") as? Date else { return }
        self.name = name
        self.brand = brand
        self.volume = aDecoder.decodeInteger(forKey: "volume")
        self.price = aDecoder.decodeInteger(forKey: "price")
        self.temperature = aDecoder.decodeDouble(forKey: "temperature")
        self.manufacturingDate = manufacturingDate
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.brand, forKey: "brand")
        aCoder.encode(self.volume, forKey: "volume")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.temperature, forKey: "temperature")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.manufacturingDate, forKey: "manufacturingDate")
    }
    func checkAvailableList(with balance: Int) -> Bool {
        return balance >= price
    }
}
extension Beverage {
    func copy(with zone: NSZone? = nil) -> Any {
        let newBeverage = Beverage()
        return newBeverage
    }
}
