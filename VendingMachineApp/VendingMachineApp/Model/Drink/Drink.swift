//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink: NSObject {
    var typeOfProduct: String
    var maintenanceDay: Double
    private(set) var calorie: Int
    private(set) var brand: String
    private(set) var weight: Int
    private(set) var price: Int
    private(set) var name: String
    private(set) var dateOfManufacture: Date
    var expirationDate: Date? {
        return Date(timeInterval: 3600 * 24 * maintenanceDay, since: dateOfManufacture)
    }
    override var description: String {
        return String(format: "%@(%@) - %@, %dml, %d원, %@, %@",
                      typeOfProduct,
                      className,
                      brand,
                      weight,
                      price,
                      name,
                      dateFormatter.string(from: dateOfManufacture))
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return formatter
    }()

    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String) {
        guard let kiloCalorie = calorie.convertToInt(from: "kcal"),
            let weight = weight.convertToInt(from: "ml"),
            let price = price.convertToInt(from: "원"),
            let dateOfManufacture = dateFormatter.date(from: dateOfManufacture) else {
                return nil
        }
        self.typeOfProduct = "음료수"
        self.maintenanceDay = 0
        self.calorie = kiloCalorie
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }

    func valid(with date: Date) -> Bool {
        guard let expirationDay = self.expirationDate else {
            return false
        }
        return date < expirationDay
    }

}

extension NSObject {
    var className: String {
        guard let className = String(describing: type(of: self))
            .components(separatedBy: ".")
            .last else {
                return ""
        }
        return className
    }

    class var className: String {
        guard let className = String(describing: self)
            .components(separatedBy: ".")
            .last else {
                return ""
        }
        return className
    }

    var typeName: String {
        var typeName = ""
        switch self {
        case is Milk:
            typeName = Milk.className()
        case is SoftDrink:
            typeName = SoftDrink.className()
        case is Coffee:
            typeName  = Coffee.className()
        default:
            typeName = self.className
        }
        return typeName
    }
}

extension Drink {

    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.className == rhs.className
    }

    override var hashValue: Int {
        return className.hashValue
    }

}



