//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    private var brand: String
    private var volume: Int
    private var price: Int
    private var name: String
    private var date: Date
    var expire: Date {
        return date
    }
    
    override var description: String {
        return "\(self.className) - \(brand), \(volume)ml, \(price)원, \(name), \(date.readable)"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.date = date
    }
    
    func isValidate(at target: Date = Date()) -> Bool {
        return target < expire
    }
    
    func isPurchasable(with money: Int) -> Int? {
        return price <= money ? price : nil
    }
    
    // isSelectable = 선택할 수 있는지 유무 : 잔액이 0 이라면 선택X / 그 이상이라면 선택할 수 있게 가격과 함께 반환
    func tag(hasPrice: Bool) -> String {
        return hasPrice ? "\(name) \(price)원" : "\(name)"
    }
    
    func isEqual(to object: Beverage?) -> Bool {
        return object?.brand == self.brand && object?.name == self.name && object?.date == self.date
    }
}
