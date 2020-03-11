//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    static let lowCalorieStandard = 30.0
    private let brand: String
    private let amount: Int
    private(set) var price: Money
    private(set) var name: String
    private(set) var calorie: Double
    private(set) var isHot: Bool
    private let manufacturingDate: Date
    private let expirationDate: Date
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, isHot:Bool = false) {
        self.brand = brand
        self.amount = amount
        self.price = price
        self.name = name
        self.calorie = calorie
        self.manufacturingDate = Date()
        self.expirationDate = Calendar.current.date(byAdding: .day, value: saleablePeriod, to: manufacturingDate)!
        self.isHot = isHot
    }
    
    func isLowCalorie() -> Bool {
        return calorie < Beverage.lowCalorieStandard
    }
    
    func validate(with date: Date) -> Bool {
        return date < expirationDate
    }
    
    // MARK: - CustomStringConvertible
    
    override var description: String {
        "\(brand), \(amount)ml, \(price)원, \(name), \(manufacturingDate.formattedDate)"
    }

    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        guard let brand = coder.decodeObject(forKey: "brand") as? String,
            let price = coder.decodeObject(forKey: "price") as? Money,
            let name = coder.decodeObject(forKey: "name") as? String,
            let manufacturingDate = coder.decodeObject(forKey: "manufacturingDate") as? Date,
            let expirationDate = coder.decodeObject(forKey: "expirationDate") as? Date else { return nil }
        self.brand = brand
        self.amount = coder.decodeInteger(forKey: "beverageAmount")
        self.price = price
        self.name = name
        self.calorie = coder.decodeDouble(forKey: "calorie")
        self.isHot = coder.decodeBool(forKey: "isHot")
        self.manufacturingDate = manufacturingDate
        self.expirationDate = expirationDate
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(amount, forKey: "beverageAmount")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(calorie, forKey: "calorie")
        coder.encode(isHot, forKey: "isHot")
        coder.encode(manufacturingDate, forKey: "manufacturingDate")
        coder.encode(expirationDate, forKey: "expirationDate")
    }
}

extension Beverage: Comparable {
    static func < (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        lhs.brand == rhs.brand && lhs.name == rhs.name 
    }
}

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
}
