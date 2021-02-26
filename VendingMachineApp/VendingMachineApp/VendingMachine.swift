//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var inList: Beverages
    private var outList: Beverages
    private var moneyBox: MoneyBox
    private var organizer: Organizer
    
    init() {
        inList = Beverages()
        outList = Beverages()
        moneyBox = MoneyBox()
        organizer = Organizer(with: moneyBox)
    }
    
    func addStock(of beverage: Beverage) {
        inList.add(beverage)
    }
    
    func insert(money: Int) {
        moneyBox.update(amount: money)
    }

    func moneyLeft() -> Int {
        return moneyBox.balance()
    }
    
    func buy(beverage: Beverage) {
        guard beverage.isPurchashable(with: moneyBox.balance()) else { return }
        
        if let beverageToSell = inList.pullOut(beverage) {
            outList.add(beverageToSell)
            beverage.bought(moneyBox.update(amount:))
        }
    }
}

//MARK: - 상품정보 반환 관련 
extension VendingMachine {
    
    func allStocks() -> [Beverage: Int] {
        return inList.listByType(filter: nil)
    }
    
    func purchased() -> [Beverage] {
        return outList.listByTime(filter: nil)
    }
    
    func affordables() -> [Beverage] {
        return organizer.affordables(from: inList)
    }
    
    func expiredItems() -> [Beverage: Int] {
        return organizer.expiredItems(from: inList)
    }
    
    func hotItems() -> [Beverage] {
        return organizer.hotItems(from: inList)
    }
    
    func transportables() -> [Beverage] {
        return organizer.transportables(from: inList)
    }
    
    func healthyItems() -> [Beverage] {
        return organizer.healthyItems(from: inList)
    }
}
