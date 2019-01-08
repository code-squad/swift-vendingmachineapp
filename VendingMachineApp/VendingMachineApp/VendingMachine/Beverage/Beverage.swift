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
    required init?(coder aDecoder: NSCoder) {
        guard let brand = aDecoder
            .decodeObject(of: NSString.self, forKey: Keys.brand.rawValue) else { return nil }
        guard let name = aDecoder
            .decodeObject(of: NSString.self, forKey: Keys.name.rawValue) else { return nil }
        guard let volume = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.volume.rawValue) else { return nil }
        guard let price = aDecoder
            .decodeObject(of: NSNumber.self , forKey: Keys.price.rawValue) else { return nil }
        guard let dateOfManufacture = aDecoder
            .decodeObject(of: NSDate.self, forKey: Keys.dateOfManufacture.rawValue) else { return nil }
        self.brand = brand as String
        self.name = name as String
        self.volume = volume.intValue
        self.price = price.intValue
        self.dateOfManufacture = dateOfManufacture as Date
    }

}

extension Beverage: NSSecureCoding {

    enum Keys: String {
        case brand = "brand"
        case name = "name"
        case volume = "volume"
        case price = "price"
        case dateOfManufacture = "dateOfManufacture"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(brand as NSString, forKey: Keys.brand.rawValue)
        aCoder.encode(name as NSString, forKey: Keys.name.rawValue)
        aCoder.encode(NSNumber(value: volume), forKey: Keys.volume.rawValue)
        aCoder.encode(NSNumber(value: price), forKey: Keys.price.rawValue)
        aCoder.encode(dateOfManufacture as NSDate, forKey: Keys.dateOfManufacture.rawValue)
    }

}
