//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct VendingMachine {
    let stock: Stock = Stock()
    private var purchased: [Beverage] = []
    private var balance: Int = 0
    
    init() {
        
    }
    
    mutating func putMoney(_ money: Int) {
        balance += money
    }
    
    func addToStock(beverage: Beverage) {
        stock.enqueue(beverage: beverage)
    }
    
    func beveragesCanBuy() -> [BeverageType: [Beverage]] {
        return stock.stockOf
    }
    
    mutating func buyBeverage(_ beverage: Beverage) -> Beverage? {
        balance -= beverage.price
        return stock.dequeue(beverage: beverage)
    }
    
    func informationOf(beverage: Beverage) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(beverage.description), \(dateFormatter.string(from: beverage.dateOfManufacture))"
    }
}
