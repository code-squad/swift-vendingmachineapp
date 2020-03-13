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
    
    required init(coder: NSCoder) {
        self.amount = coder.decodeInteger(forCustomKey: .amount)
        self.calorie = coder.decodeDouble(forCustomKey: .calorie)
        self.isHot = coder.decodeBool(forCustomKey: .isHot)
        guard let brand = coder.decodeObject(forCustomKey: .brand) as? String,
            let price = coder.decodeObject(forCustomKey: .price) as? Money,
            let name = coder.decodeObject(forCustomKey: .name) as? String,
            let manufacturingDate = coder.decodeObject(forCustomKey: .manufacturingDate) as? Date,
            let expirationDate = coder.decodeObject(forCustomKey: .expirationDate) as? Date else {
                self.brand = ""
                self.price = Money()
                self.name = "soldOut"
                self.manufacturingDate = Date()
                self.expirationDate = Date()
                return
        }
        self.brand = brand
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
        self.expirationDate = expirationDate
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forCustomKey: .brand)
        coder.encode(amount, forCustomKey: .beverageAmount)
        coder.encode(price, forCustomKey: .price)
        coder.encode(name, forCustomKey: .name)
        coder.encode(calorie, forCustomKey: .calorie)
        coder.encode(isHot, forCustomKey: .isHot)
        coder.encode(manufacturingDate, forCustomKey: .manufacturingDate)
        coder.encode(expirationDate, forCustomKey: .expirationDate)
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
