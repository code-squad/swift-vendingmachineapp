//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation

<<<<<<< HEAD
enum BeverageType {
    case Milk
    case Soda
    case Coffee
}

=======
>>>>>>> b528f772da80ea2bcbf1b4f1e3af963c7b0c09e8

class Drink : CustomStringConvertible {
    
    private let brand: String
<<<<<<< HEAD
    private let capacity: Int
    private let price: Int
    private let name : String
    private let madeDate : Date
    private var isHot: Bool
    private let beverageType:BeverageType
    
    init(brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool, beverageType:BeverageType) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.madeDate = madeDate
        self.isHot = isHot
        self.beverageType = beverageType
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(madeDate.getStringFromDate())"
    }
    
    //MARK: 온음료 확인
    func isHotable() -> Bool {
        return isHot
    }
    
    //MARK: 구매가능 음료 확인
    func isPurchasableDrink(money: Int) -> Bool{
        return money >= price
    }
    
    func isBeverageType() -> String {
        switch beverageType {
        case .Milk:
            return "우유"
        case .Soda:
            return "소다"
        case .Coffee:
            return "커피"
        }
    }
}

extension Drink: ExpireCheckableProtocol {
    
    //MARK: 유통기한 확인
    func isExpireDate(with date: Date) -> Bool {
        return madeDate < date
    }  
}

extension Drink: Equatable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.brand == rhs.brand
            && lhs.capacity == rhs.capacity
            && lhs.price == rhs.price
            && lhs.name == rhs.name
            && lhs.madeDate == rhs.madeDate
            && lhs.isHot == rhs.isHot
            && lhs.beverageType == rhs.beverageType
=======
    private let weight: Int
    private let price: Int
    private let name : String
    private let madeDate : Date
    
    init(brand: String, weight: Int, price: Int, name: String, madeDate: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.madeDate = madeDate
    }
    
    var description: String {
        return "\(brand), \(weight)ml, \(price)원, \(name), \(madeDate.getStringFromDate())"
>>>>>>> b528f772da80ea2bcbf1b4f1e3af963c7b0c09e8
    }
}




