//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink: NSObject, NSCoding {
    var typeOfProduct: String
    var maintenanceDay: Double
    private(set) var calorie: Int
    private(set) var brand: String
    private(set) var weight: Int
    private(set) var price: Int
    private(set) var name: String
    private(set) var dateOfManufacture: Date
    var expirationDate: Date {
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

    private enum CodingKeys: String {
        case calorie, brand, weight
        case price, name, dateOfManufacture
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(calorie, forKey: CodingKeys.calorie.rawValue)
        aCoder.encode(brand, forKey: CodingKeys.brand.rawValue)
        aCoder.encode(weight, forKey: CodingKeys.weight.rawValue)
        aCoder.encode(price, forKey: CodingKeys.price.rawValue)
        aCoder.encode(name, forKey: CodingKeys.name.rawValue)
        aCoder.encode(dateOfManufacture, forKey: CodingKeys.dateOfManufacture.rawValue)
    }

    required init?(coder aDecoder: NSCoder) {
        calorie = aDecoder.decodeInteger(forKey: CodingKeys.calorie.rawValue)
        weight = aDecoder.decodeInteger(forKey: CodingKeys.weight.rawValue)
        price = aDecoder.decodeInteger(forKey: CodingKeys.price.rawValue)
        guard let brand = aDecoder.decodeObject(forKey: CodingKeys.brand.rawValue) as? String,
            let name = aDecoder.decodeObject(forKey: CodingKeys.name.rawValue) as? String,
            let dateOfManufacture = aDecoder.decodeObject(forKey: CodingKeys.dateOfManufacture.rawValue) as? Date else {
                return nil
        }
        self.brand = brand
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        typeOfProduct = "음료수"
        maintenanceDay = 0
        super.init()
    }

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
        super.init()
    }

    

    func valid(with date: Date) -> Bool {
        return date < expirationDate
    }

}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
    return formatter
}()

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

}

extension Drink {

    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.className == rhs.className
    }

    override var hashValue: Int {
        return className.hashValue
    }

}

protocol Mappable: Codable {
    init?(jsonString: String)

}
extension Mappable {
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        self = try! JSONDecoder().decode(Self.self, from: data)
        // I used force unwrap for simplicity.
        // It is better to deal with exception using do-catch.
    }
}
