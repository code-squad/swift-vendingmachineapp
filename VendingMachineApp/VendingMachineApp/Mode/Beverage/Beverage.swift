//
//  Beverage.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//
import Foundation

typealias ResultGoods = (String, Int) -> Void

class Beverage: NSObject {

    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturedDate: Date
    private let expiryPeriod: ExpirationPeriod

    init(brand: String,
         volume: Int,
         price: Int,
         name: String,
         manufacturedDate: Date ,
         expiryPeriod: ExpirationPeriod) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expiryPeriod = expiryPeriod
    }

    // Required Initializers
    override required convenience init() {
        self.init(
            brand: "",
            volume: 0,
            price: 0,
            name: "",
            manufacturedDate: Date(),
            expiryPeriod: ExpirationPeriod(endDay: 0)
        )
    }

    override var description: String {
        return "\(name) \(price)"
    }

    var className: String {
        return String(describing: type(of: self))
    }

    //유통기한
    func isEqualExpirationDate() -> Bool {
        let expirationDate = Date.addDate(endDate: expiryPeriod, day: manufacturedDate)
        return Date.isEqualDate(manufacturedDate: expirationDate)
    }

    func canBuy(money: Money) -> Bool {
        return money.isBuy(money: price)
    }

    func subtract(pay: Money) {
        pay.subtract(price: price)
    }

    func doPurchase(goods: ResultGoods) {
        goods(name, price)
    }

    var title: String {
        return name
    }

    func showPurchase(with show: (String, Int) -> Void) {
        show(name, price)
    }
    
    // MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        
        let brand = aDecoder.decodeObject(of: NSString.self, forKey: "brand") ?? ""
        let volume = aDecoder.decodeObject(of: NSNumber.self, forKey: "volume") ?? 0
        let price = aDecoder.decodeObject(of: NSNumber.self, forKey: "price") ?? 0
        let name = aDecoder.decodeObject(of: NSString.self, forKey: "name") ?? ""
        let manufacturedDate = aDecoder.decodeObject(of: NSDate.self, forKey: "manufacturedDate") ?? Date() as NSDate
        let expiryPeriod = aDecoder.decodeObject(of: NSNumber.self, forKey: "expiryPeriod") ?? 0

        self.brand = brand as String
        self.volume = volume.intValue
        self.price = price.intValue
        self.name = name as String
        self.manufacturedDate = manufacturedDate as Date
        self.expiryPeriod = ExpirationPeriod(endDay: expiryPeriod.intValue)
    }

}

extension Beverage: NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand as NSString, forKey: "brand")
        aCoder.encode(NSNumber(value: volume), forKey: "volume")
        aCoder.encode(NSNumber(value: price), forKey: "price")
        aCoder.encode(name as NSString, forKey: "name")
        aCoder.encode(manufacturedDate as NSDate, forKey: "manufacturedDate")
        aCoder.encode(NSNumber(value: expiryPeriod.endDateSecond()) , forKey: "expiryPeriod")
    }
    
}
