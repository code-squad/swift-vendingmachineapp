//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import Foundation

class Drink : CustomStringConvertible, Hashable {
    private var brand: String
    private var capacity: Int
    private (set) var price: Money
    private var name: String
    private var manufacturedDate: Date
    private var expiration: Date
    private var hot: Bool
    private var calorie: Int
    

    
    init(brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expiration: Date, hot: Bool, calorie: Int){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expiration = expiration
        self.hot = hot
        self.calorie = calorie
    }
    
    convenience init() {
        self.init(brand: "", capacity: 0, price: Money(), name: "", manufacturedDate: Date(), expiration: Date(), hot: false, calorie: 0)
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(manufacturedDate.description)"
    }
    
    func canBuy(with credit: Money) -> Bool {
        return credit > price
    }
    
    func isHot() -> Bool {
        return hot
    }
    
    func isLowCalore() -> Bool {
        return calorie < 300
    }
    
    func validate(date: Date) -> Bool {
        return expiration < date
    }
    
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(brand)
    }
}
