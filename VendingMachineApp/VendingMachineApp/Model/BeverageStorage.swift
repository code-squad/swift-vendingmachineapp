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
    
    public var stock: [Item]
    
    override init() {
        stock = []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(stock, forKey: "stock")
    }
    
    required init?(coder: NSCoder) {
        stock = coder.decodeObject(forKey: "stock") as! [Item]
    }
    
    public func addStock(beverage: Beverage, count: Int) {
        let newItem = Item(beverage: beverage, count: count)
        self.stock.append(newItem)
    }
    
    public func increaseStock(beverage: Beverage, by amount: Int) {
        stock.forEach { (item) in
            if item.beverage == beverage {
                item.increaseCount(by: amount)
                NotificationCenter.default.post(name: .didIncreaseStock, object: nil)
            }
        }
    }
    
    public func checkSpecificBeverageCount(beverage: Beverage) -> Int {
        var result = 0
        
        stock.forEach { (item) in
            if item.beverage == beverage {
                result = item.count
            }
        }
        return result
    }
//
//    public func checkPurchasables(with money: Int) -> [Beverage:Int] {
//        let purchasableBeverages = stock.filter { (bev, amt) -> Bool in
//            bev.isPurchasable(with: money)
//        }
//        return purchasableBeverages
//    }
//
//    public func checkExpired(on date: Date) -> [Beverage:Int] {
//        let purchasableBeverages = stock.filter { (bev, amt) -> Bool in
//            bev.isExpired(on: date)
//        }
//        return purchasableBeverages
//    }
//
//    public func decreaseStock(beverage: Beverage, completionHandler: (Result<Beverage, StockError>) -> Void) {
//        if stock[beverage] != nil {
//            stock[beverage]! -= 1
//            completionHandler(.success(beverage))
//        } else {
//            completionHandler(.failure(StockError.noStock))
//        }
//    }
}

