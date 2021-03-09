//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class BeverageStorage: NSObject, Storage, NSCoding {

    private var stockList: [ObjectIdentifier: [Beverage]]
    
    override init() {
        stockList = [:]
    }
    
    required init?(coder: NSCoder) {
        self.stockList = coder.decodeObject(forKey: "stockList") as! [ObjectIdentifier: [Beverage]]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(stockList, forKey: "stockList")
    }
    
    func add(_ item: Shopable) {
        updateStockList(of: item as! Beverage)
    }
    
    private func updateStockList(of beverage: Beverage) {
        let id = ObjectIdentifier(beverage)
        
        if stockList[id] != nil {
            stockList[id]!.append(beverage)
        } else {
            stockList[id] = [beverage]
        }
    }
    
    func pullOut(_ itemType: Shopable.Type) -> Shopable? {
        let id = ObjectIdentifier(itemType)
        
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
    
    func listTypeOnly(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier])) -> [ObjectIdentifier] {
        return filter(stockList)
    }
    
    func listTypeCount() -> [ObjectIdentifier: Int] {
        var idCountList = [ObjectIdentifier: Int]()
        
        for (key, value) in stockList {
            idCountList[key] = value.count
        }
        return idCountList
    }
    
    func listTypeCount(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier: Int])) -> [ObjectIdentifier: Int] {
        return filter(stockList)
    }
}
