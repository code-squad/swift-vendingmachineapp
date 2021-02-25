//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var beverages: [Beverage]
    private var stockList: [Beverage: Int]
    private var money: Int
    private var outList: [Beverage]
    
    init() {
        beverages = []
        stockList = [:]
        money = 0
        outList = []
    }
    
    mutating func addStock(of beverage: Beverage) {
        beverages.append(beverage)
        updateStockList(of: beverage, by: 1)
    }
    
    private mutating func updateStockList(of beverage: Beverage, by amount: Int) {
        if stockList[beverage] != nil {
            stockList[beverage]! += amount
        } else {
            stockList[beverage] = amount
        }
        checkSoldout(for: beverage)
    }
    
    private mutating func checkSoldout(for beverage: Beverage) {
        if stockList[beverage] == 0 {
            stockList[beverage] = nil
        }
    }
    
    func allStocks() -> Dictionary<Beverage, Int> {
        return stockList
    }
    
    func purchased() -> [Beverage] {
        return outList
    }
}


//MARK: - 이용자 관련
extension VendingMachine {
    mutating func insert(money: Int) {
        self.money = moneyUpdator(amount: money)
    }
    
    private func moneyUpdator(amount: Int) -> Int {
        return money + amount
    }
    
    func moneyLeft() -> Int {
        return money
    }
    
    func purchashables() -> [Beverage] {
        var purchashableList = [Beverage]()
        
        stockList.forEach { (beverage: Beverage, _: Int) in
            if beverage.isPurchashable(with: money){
                purchashableList.append(beverage)
            }
        }
        return purchashableList
    }
    
    mutating func buy(beverage: Beverage) {
        if stockList[beverage] != nil,
           beverage.isPurchashable(with: money) {
            
            if let targetIdx = beverages.firstIndex(of: beverage) {
                outList.append(beverages[targetIdx])
                beverages.remove(at: targetIdx)
                updateStockList(of: beverage, by: -1)
                money = beverage.bought(moneyUpdator: moneyUpdator(amount:))
            }
        }
    }
}


//MARK: - 특정 콘디션에 맞는 음료수 반환
extension VendingMachine {
    
    func expiredStocks() -> Dictionary<Beverage, Int> {
        var expiredList = Dictionary<Beverage, Int>()
        
        beverages.forEach { (bev) in
            if let beverage = bev as? Beverage & Expirable,
               beverage.isExpired() {
                if expiredList[beverage] != nil {
                    expiredList[beverage]! += 1
                } else {
                    expiredList[beverage] = 1
                }
            }
        }
        return expiredList
    }
    
    func hotBeverages() -> [Beverage] {
        var beverageList = [Beverage]()
        
        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & Hotable,
               beverage.isHotable() {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
    
    func transportables() -> [Beverage] {
        var beverageList = [Beverage]()
        
        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & Transportable,
               beverage.isTransportable() {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
    
    func healthyBeverages() -> [Beverage] {
        var beverageList = [Beverage]()
        
        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & SugarFreeable & LactoFreeable,
               beverage.isSugarFree(), beverage.isLactoFree() {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
}
