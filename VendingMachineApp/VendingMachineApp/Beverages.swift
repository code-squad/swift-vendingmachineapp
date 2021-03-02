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
        updateToSoldout(for: beverage)
    }
    
    private func updateToSoldout(for beverage: Beverage) {
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
}

//MARK: - 목록 반환 관련
extension Beverages {
    
    func listTypeOnly() -> [Beverage] {
        return storage
    }
    
    func listTypeOnly(filter: (([Beverage: Int]) -> [Beverage])) -> [Beverage] {
        return filter(stockList)
    }
    
    func listTypeCount() -> [Beverage: Int] {
        return stockList
    }
    
    func listTypeCount(filter: (([Beverage]) -> [Beverage: Int])) -> [Beverage: Int] {
        return filter(storage)
    }
}
