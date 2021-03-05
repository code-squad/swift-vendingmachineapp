//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class BeverageStorage {

    private var stockList: [ObjectIdentifier: [Beverage]]
    
    init() {
        stockList = [:]
    }
    
    func add(_ beverage: Beverage) {
        updateStockList(of: beverage)
    }
    
    private func updateStockList(of beverage: Beverage) {
        let id = ObjectIdentifier(beverage)
        
        if stockList[id] != nil {
            stockList[id]!.append(beverage)
        } else {
            stockList[id] = [beverage]
        }
    }
    
    func pullOut(_ beverageType: Beverage.Type) -> Beverage? {
        let id = ObjectIdentifier(beverageType)
        
        if let targetItem = stockList[id]?[0] {
            stockList[id]?.removeFirst()
            updateToSoldout(for: id)
            return targetItem
        } else {
            return nil
        }
    }
    
    private func updateToSoldout(for id: ObjectIdentifier) {
        guard stockList[id] != nil else { return }
        
        if stockList[id]!.count == 0 {
            stockList[id] = nil
        }
    }
}

//MARK: - 목록 반환 관련
extension BeverageStorage {
    
    func listTypeOnly() -> [ObjectIdentifier] {
        return stockList.keys.map{ $0 }
    }
    
    func listTypeOnly(filter: (([ObjectIdentifier: [Beverage]]) -> [ObjectIdentifier])) -> [ObjectIdentifier] {
        return filter(stockList)
    }
    
    func listTypeCount() -> [ObjectIdentifier: Int] {
        var idCountList = [ObjectIdentifier: Int]()
        
        for (key, value) in stockList {
            idCountList[key] = value.count
        }
        return idCountList
    }
    
    func listTypeCount(filter: (([ObjectIdentifier: [Beverage]]) -> [ObjectIdentifier: Int])) -> [ObjectIdentifier: Int] {
        return filter(stockList)
    }
}
