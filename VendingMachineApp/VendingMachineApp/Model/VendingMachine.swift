//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var productList: Beverages
    private var soldList: Beverages
    private var moneyBox: MoneyBox
    private var filterer: Filterer
    
    init(dateStandard: Date, temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        productList = Beverages()
        soldList = Beverages()
        moneyBox = MoneyBox()
        filterer = Filterer(dateStandard: dateStandard,
                              temperatureStandard: temperatureStandard,
                              sugarStandard: sugarStandard,
                              lactoStandard: lactoStandard)
    }
    
    func addStock(of beverage: Beverage) {
        productList.add(beverage)
    }
    
    func insert(money: Int) {
        moneyBox.update(amount: money)
    }

    func moneyLeft() -> Int {
        return moneyBox.balance()
    }
    
    func buy(beverage: Beverage) {
        guard beverage.isPurchashable(with: moneyBox.balance()) else { return }
        
        if let beverageToSell = productList.pullOut(beverage) {
            soldList.add(beverageToSell)
            
            let moneyAfterPurchase = beverage.subtractPrice(from: moneyBox.balance())
            moneyBox.update(to: moneyAfterPurchase)
        }
    }
}

//MARK: - 상품정보 반환 관련 
extension VendingMachine {
    
    func allStocks() -> [Beverage: Int] {
        return productList.listTypeCount()
    }
    
    func purchased() -> [Beverage] {
        return soldList.listTypeOnly()
    }
    
    func affordables() -> [Beverage] {
        return moneyBox.affordableList(from: productList)
    }
    
    func expiredItems() -> [Beverage: Int] {
        return filterer.expiredItems(from: productList)
    }
    
    func hotItems() -> [Beverage] {
        return filterer.hotItems(from: productList)
    }
    
    func transportables() -> [Beverage] {
        return filterer.transportables(from: productList)
    }
    
    func healthyItems() -> [Beverage] {
        return filterer.healthyItems(from: productList)
    }
}
