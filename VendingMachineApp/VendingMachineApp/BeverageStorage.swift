//
//  BeverageStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BeverageStorage {
    private var stock: [Beverage:Int]
    var purchasables: (() -> [Beverage:Int])?
    
    enum StockError: Error {
        case noStock
    }
    
    init() {
        stock = [:]
    }
    
    public func increaseStock(beverage: Beverage, by amount: Int) {
        if stock[beverage] != nil {
            stock[beverage]! += 1
        } else {
            stock[beverage] = amount
        }
    }

    public func checkStock() -> [Beverage:Int] {
       return stock
    }
    
    // make it into closure?
    public func checkPurchasables2(handler: (Beverage) -> Void) {
        stock.keys.forEach { (beverage) in
            handler(beverage)
        }
    }

    public func checkPurchasables(with money: Int) -> [Beverage:Int] {
        let purchasableBeverages = stock.filter { (bev, amt) -> Bool in
            bev.isPurchasable(with: money)
        }
        return purchasableBeverages
    }
    
    public func checkExpired() -> [Beverage:Int] {
        let purchasableBeverages = stock.filter { (bev, amt) -> Bool in
            bev.isExpired()
        }
        return purchasableBeverages
    }
    
    public func decreaseStock(beverage: Beverage) throws {
        if stock[beverage] != nil {
            stock[beverage]! -= 1
        } else {
            throw StockError.noStock
        }
    }
}

