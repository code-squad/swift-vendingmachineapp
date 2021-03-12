//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class BeverageStorage: NSObject, Storage, NSCoding {

    private var stockList: [ObjectIdentifier: [Shopable]]
    
    override init() {
        stockList = [:]
    }
    
    enum Keys {
        static let stockValues = "stockValues"
    }
    
    required init?(coder: NSCoder) {
        let values = coder.decodeObject(forKey: Keys.stockValues) as! [[Shopable]]
        var stockList = [ObjectIdentifier: [Shopable]]()
        values.forEach({ (value) in
            stockList[ObjectIdentifier(type(of: value[0]))] = value
        })
        self.stockList = stockList
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(onlyValues(), forKey: Keys.stockValues)
    }
    
    private func onlyValues() -> [[Shopable]] {
        var values = [[Shopable]]()
        
        stockList.values.forEach { (beverages) in
            values.append(beverages)
        }
        return values
    }
    
    func add(_ item: Shopable) {
        updateStockList(of: item)
    }
    
    private func updateStockList(of beverage: Shopable) {
        let id = ObjectIdentifier(type(of: beverage))
        
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
