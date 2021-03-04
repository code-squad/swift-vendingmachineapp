//
//  Order.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/04.
//

import Foundation

struct Order {
    private let purchased: Date
    private let item: Beverage
    
    init(purchased: Date, item: Beverage) {
        self.purchased = purchased
        self.item = item
    }
}
