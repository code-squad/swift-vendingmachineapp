//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var storage: BeverageStorage
    private var dispensedList: DispensedList
    private var moneyBox: MoneyBox
    private var filterer: Filterer
    
    init(dateStandard: Date, temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        storage = BeverageStorage()
        dispensedList = DispensedList()
        moneyBox = MoneyBox()
        filterer = Filterer(dateStandard: dateStandard,
                              temperatureStandard: temperatureStandard,
                              sugarStandard: sugarStandard,
                              lactoStandard: lactoStandard)
    }
    
    func addStock(of beverage: Beverage) {
        storage.add(beverage)
    }
    
    func insert(money: Int) {
        moneyBox.update(amount: money)
    }

    func moneyLeft() -> Int {
        return moneyBox.balance()
    }
    
    func buy(beverage: Beverage) {
        guard beverage.isPurchashable(with: moneyBox.balance()) else { return }
        
        if let beverageToSell = storage.pullOut(type(of: beverage)) {
            dispensedList.update(soldItem: beverageToSell)
            
            let moneyAfterPurchase = beverage.subtractPrice(from: moneyBox.balance())
            moneyBox.update(to: moneyAfterPurchase)
        }
    }
}

//MARK: - 상품정보 반환 관련 
extension VendingMachine {
    
    func allStocks() -> [ObjectIdentifier: Int] {
        return storage.listTypeCount()
    }
    
    func purchased() -> [Beverage] {
        return dispensedList.items
    }
    
    func affordables() -> [ObjectIdentifier] {
        return moneyBox.affordableList(from: storage)
    }
    
    func expiredItems() -> [ObjectIdentifier: Int] {
        return filterer.expiredItems(from: storage)
    }
    
    func hotItems() -> [ObjectIdentifier] {
        return filterer.hotItems(from: storage)
    }
    
    func transportables() -> [ObjectIdentifier] {
        return filterer.transportables(from: storage)
    }
    
    func healthyItems() -> [ObjectIdentifier] {
        return filterer.healthyItems(from: storage)
    }
}
