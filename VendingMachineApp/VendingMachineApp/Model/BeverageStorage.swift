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
    
    private func handleEachItem(handler: (Item)-> Void) {
        stock.forEach { (item) in
            handler(item)
        }
    }
    
    public func addStock(beverage: Beverage, count: Int) {
        let newItem = Item(beverage: beverage, count: count)
        self.stock.append(newItem)
    }
    
    public func increaseStock(beverage: Beverage, by amount: Int) {
        handleEachItem { (item) in
            if item.beverage == beverage {
                item.increaseCount(by: amount)
                NotificationCenter.default.post(name: .didIncreaseStock, object: self)
            }
        }
    }
    
    public func decreaseStockByOne(beverage: Beverage, completionHandler: (Result<Beverage, StockError>) -> Void) {
        handleEachItem { (item) in
            if item.beverage == beverage {
                item.decreaseCount(by: 1)
                completionHandler(.success(beverage))
            } else {
                completionHandler(.failure(StockError.noStock))
            }
        }
    }
    
    public func checkSpecificBeverageCount(beverage: Beverage) -> Int {
        var result = 0
        handleEachItem { (item) in
            if item.beverage == beverage {
                result = item.count
            }
        }
        return result
    }

    public func checkPurchasables(with money: Int) -> [Item] {
        let purchasableBeverages = stock.filter { (item) -> Bool in
            item.beverage.isPurchasable(with: money)
        }
        return purchasableBeverages
    }

    public func checkExpired(on date: Date) -> [Item] {
        let purchasableBeverages = stock.filter { (item) -> Bool in
            item.beverage.isExpired(on: date)
        }
        return purchasableBeverages
    }
}

