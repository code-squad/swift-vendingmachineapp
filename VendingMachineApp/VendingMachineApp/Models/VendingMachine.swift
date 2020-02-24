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
    let products: [Beverage]
    private var purchased: [Beverage] = []
    private(set) var balance: Int = 0
    
    init(products: [Beverage]) {
        self.products = products
    }
    
    mutating func putMoney(_ money: Int) {
        balance += money
    }
    
    func addToStock(beverage: Beverage) {
        stock.enqueue(beverage: beverage)
    }
    
    func numberOfBeverage(type: BeverageType) -> Int {
        return stock.numberOfBeverage(type: type)
    }
    
    func availableBeverages() -> [BeverageType] {
        var availableBeverages: [BeverageType] = []
        products.forEach { (product) in
            if balance > product.price {
                availableBeverages.append(BeverageType(of: product))
            }
        }
        return availableBeverages
    }
    
    @discardableResult mutating func buyBeverage(_ beverage: Beverage) -> Beverage? {
        guard balance >= beverage.price && stock.numberOfBeverage(type: BeverageType(of: beverage)) > 0 else { return nil }
        balance -= beverage.price
        let boughtOne = stock.dequeue(beverage: beverage)
        purchased.append(boughtOne)
        return boughtOne
        return stock.dequeue(beverage: beverage)
    }
    
    func informationOf(beverage: Beverage) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(beverage.description), \(dateFormatter.string(from: beverage.dateOfManufacture))"
    }
}
