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
    private var filterer: Filterer
    
    init(dateStandard: Date, temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        inList = Beverages()
        outList = Beverages()
        moneyBox = MoneyBox()
        filterer = Filterer(dateStandard: dateStandard,
                              temperatureStandard: temperatureStandard,
                              sugarStandard: sugarStandard,
                              lactoStandard: lactoStandard)
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
            
            let moneyAfterPurchase = beverage.subtractPrice(from: moneyBox.balance())
            moneyBox.update(to: moneyAfterPurchase)
        }
    }
}

//MARK: - 상품정보 반환 관련 
extension VendingMachine {
    
    func allStocks() -> [Beverage: Int] {
        return inList.listTypeCount()
    }
    
    func purchased() -> [Beverage] {
        return outList.listTypeOnly()
    }
    
    func affordables() -> [Beverage] {
        return moneyBox.affordableList(from: inList)
    }
    
    func expiredItems() -> [Beverage: Int] {
        return filterer.expiredItems(from: inList)
    }
    
    func hotItems() -> [Beverage] {
        return filterer.hotItems(from: inList)
    }
    
    func transportables() -> [Beverage] {
        return filterer.transportables(from: inList)
    }
    
    func healthyItems() -> [Beverage] {
        return filterer.healthyItems(from: inList)
    }
}
