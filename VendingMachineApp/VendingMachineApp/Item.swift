//
//  Item.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/24.
//

import Foundation

class Item {
    private let beverage: Beverage
    private var amount: Int
    
    init(with beverage: Beverage, of number: Int) {
        self.beverage = beverage
        self.amount = number
    }
    
    public func increaseAmount(by amount: Int = 1) {
        self.amount += amount
    }
    
    public func decreaseAmount(by amount: Int = 1) {
        self.amount -= amount
    }
    
    public func isSameItem(with item: Item) -> Bool {
        if self.beverage.isSameBeverage(with: item.beverage) {
            return true
        } else {
            return false
        }
    }
}
