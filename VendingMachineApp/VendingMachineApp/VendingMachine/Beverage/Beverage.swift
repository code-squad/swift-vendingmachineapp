//
//  Beverage.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    private let brand: String
    private let name: String
    private let volume: Int
    private let price: Int
    private let dateOfManufacture: Date

    init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date) {
        self.brand = brand
        self.name = name
        self.volume = volume
        self.price = price
        self.dateOfManufacture = dateOfManufacture
    }

    convenience required override init() {
        self.init(
            brand: "노브랜드",
            name: "물",
            volume: 500,
            price: 800,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 30))
    }

    override var description: String {
        return "\(name) \(price)원"
    }

    var className: String {
        return String(describing: type(of: self))
    }

    var title: String {
        return name
    }

    func isBuyable(for cash: Int) -> Bool {
        return price <= cash
    }

    func subtractPrice(from balance: Int) -> Int {
        return balance - price
    }

    func showPurchase(with show: (String, Int) -> Void) {
        show(name, price)
    }

    /* MARK: NSSecrueCoding */
    private struct Default {
        static let brand: NSString = "노브랜드"
        static let name: NSString = "물"
        static let volume: NSNumber = 500
        static let price: NSNumber = 800
        static let dateOfManufacture: NSDate = Date.subtractingDaysFromNow(by: 30) as NSDate
    }

    required init?(coder aDecoder: NSCoder) {
        let brand = aDecoder
            .decodeObject(of: NSString.self, forKey: Key.brand) ?? Default.brand
        let name = aDecoder
            .decodeObject(of: NSString.self, forKey: Key.name) ?? Default.name
        let volume = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Key.volume) ?? Default.volume
        let price = aDecoder
            .decodeObject(of: NSNumber.self , forKey: Key.price) ?? Default.price
        let dateOfManufacture = aDecoder
            .decodeObject(of: NSDate.self, forKey: Key.dateOfManufacture) ?? Default.dateOfManufacture
        self.brand = brand as String
        self.name = name as String
        self.volume = volume.intValue
        self.price = price.intValue
        self.dateOfManufacture = dateOfManufacture as Date
    }

}

extension Beverage: NSSecureCoding {

    private enum Key {
        static let brand = "brand"
        static let name = "name"
        static let volume = "volume"
        static let price = "price"
        static let dateOfManufacture = "dateOfManufacture"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand as NSString, forKey: Key.brand)
        aCoder.encode(name as NSString, forKey: Key.name)
        aCoder.encode(NSNumber(value: volume), forKey: Key.volume)
        aCoder.encode(NSNumber(value: price), forKey: Key.price)
        aCoder.encode(dateOfManufacture as NSDate, forKey: Key.dateOfManufacture)
    }

}
