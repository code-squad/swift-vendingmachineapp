//
//  Stock.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class Stock {
    private var stock: [Beverage: Int]
    
    init() {
        self.stock = [:]
    }
    
    func add(beverage: Beverage) {
        stock[beverage] = (stock[beverage] ?? 0) + 1
    }
    
    // return에 handler적용해보기
    func getAllStock() -> [Beverage: Int] {
        return stock
    }
    
    func purchasableBeverages(with money: Int) -> [Beverage] {
        return stock.map{ $0.key }.filter{ $0.price <= money }
    }
    
    func remove(beverage: Beverage) -> Beverage { // 음료가 없을 때, 어떻게 처리해줄까 -> 오류 검증 부분을 어디서 해주지! 일단 오류 없다고 작성
        stock[beverage] = (stock[beverage] ?? 0) - 1
        return beverage
    }
    
    func expiredBeverages() -> [Beverage] {
        var beverages = [Beverage]()
        for (key, value) in stock {
//            (0..<value).forEach{ beverages.append(key) }
            for _ in 0..<value {
                beverages.append(key)
            }
        }
        
        return beverages.filter{ beverage in
            return !beverage.isValid(with: Date())
        }
    }
    
    func hotBeverages() -> [Beverage] {
        return stock.filter{ (key, value) in
            if let coffee = key as? Coffee {
                return coffee.isHot()
            }else { return false }
        }.map{ $0.key }
    }
    
}
