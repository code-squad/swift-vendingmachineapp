//
//  BeverageStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BeverageStorage: NSObject, NSCoding {
    enum StockError: Error {
        case noStock
    }
    
    private var stock: [Beverage: Int]
    
    override init() {
        stock = [:]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(stock, forKey: "stock")
    }
    
    required init?(coder: NSCoder) {
        stock = coder.decodeObject(forKey: "stock") as! [Beverage: Int]
    }
    
    public func increaseStock(beverage: Beverage, by amount: Int) {
        if stock[beverage] != nil {
            stock[beverage]! += amount
            NotificationCenter.default.post(name: .didIncreaseStock, object: nil)
        } else {
            stock[beverage] = amount
        }
    }
//
    public func checkStock() -> [Beverage:Int] {
       return stock
    }

    public func checkPurchasables(with money: Int) -> [Beverage:Int] {
        let purchasableBeverages = stock.filter { (bev, amt) -> Bool in
            bev.isPurchasable(with: money)
        }
        return purchasableBeverages
    }

    public func checkExpired(on date: Date) -> [Beverage:Int] {
        let purchasableBeverages = stock.filter { (bev, amt) -> Bool in
            bev.isExpired(on: date)
        }
        return purchasableBeverages
    }
    
    public func decreaseStock(beverage: Beverage, completionHandler: (Result<Beverage, StockError>) -> Void) {
        if stock[beverage] != nil {
            stock[beverage]! -= 1
            completionHandler(.success(beverage))
        } else {
            completionHandler(.failure(StockError.noStock))
        }
    }
}

