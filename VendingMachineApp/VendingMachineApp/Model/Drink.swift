//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation

class Drink : CustomStringConvertible {
    
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name : String
    private let manufacturedAt : Date
    private var isHot: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedAt = madeDate
        self.isHot = isHot
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedAt.getStringFromDate())"
    }
    
    //MARK: 온음료 확인
    func isHotable() -> Bool {
        return isHot
    }
    
    //MARK: 구매가능 음료 확인
    func isPurchasableDrink(money: Int) -> Bool{
        return money >= price
    }
}

extension Drink: ExpireCheckableProtocol {
    
    //MARK: 유통기한 확인
    func isExpireDate(with date: Date) -> Bool {
        return manufacturedAt < date
    }  
}

extension Drink: Equatable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.brand == rhs.brand
            && lhs.capacity == rhs.capacity
            && lhs.price == rhs.price
            && lhs.name == rhs.name
            && lhs.manufacturedAt == rhs.manufacturedAt
            && lhs.isHot == rhs.isHot
    }
}




