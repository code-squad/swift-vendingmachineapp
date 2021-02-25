//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class VendingMachine { // 아이템에 대한 상세한 사항을 알지 못하도록 구현 (추상화) 

    private let stock = Stock()
    
    func addBeverage(brand: String, capacity: Int, price: Int, name: String, dateString: String){
        let newBeverage = Beverage(brand: brand, capacity: capacity, price: price, name: name, dateString: dateString)
        stock.add(beverage: newBeverage)
    }
    
    func showStock() -> [Beverage] {
        return stock.beverages
    }
}

class Stock {
    var beverages = [Beverage]()
    
    func isOutOfStock(beverage: Beverage) -> Bool {
        return true
    }
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
}
