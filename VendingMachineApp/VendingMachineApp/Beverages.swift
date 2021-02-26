//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class Beverages {
    
    private var storage: [Beverage]
    private var stockList: [Beverage: Int]
    
    init() {
        storage = []
        stockList = [:]
    }
    
    func add(_ beverage: Beverage) {
        storage.append(beverage)
        updateStockList(of: beverage, by: 1)
    }
    
    private func updateStockList(of beverage: Beverage, by amount: Int) {
        if stockList[beverage] != nil {
            stockList[beverage]! += amount
        } else {
            stockList[beverage] = amount
        }
        checkSoldout(for: beverage)
    }
    
    private func checkSoldout(for beverage: Beverage) {
        if stockList[beverage] == 0 {
            stockList[beverage] = nil
        }
    }
    
    func pullOut(_ beverage: Beverage) -> Beverage? {
        guard stockList[beverage] != nil else { return nil }
        
        if let targetIdx = storage.firstIndex(of: beverage) {
            let beverageToPullOut = storage[targetIdx]
            storage.remove(at: targetIdx)
            updateStockList(of: beverage, by: -1)
            return beverageToPullOut
        } else {
            return nil
        }
    }
    
    func listByTime(filter: (([Beverage: Int]) -> [Beverage])?) -> [Beverage] {
        if let filter = filter {
            return filter(stockList)
        } else {
            return storage
        }
    }
    
    func listByType(filter: (([Beverage]) -> [Beverage: Int])?) -> [Beverage: Int] {
        if let filter = filter {
            return filter(storage)
        } else {
            return stockList
        }
    }
}
