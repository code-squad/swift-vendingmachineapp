//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    fileprivate var storage: Storage
    fileprivate var dispensedList: OrderableList
    fileprivate var moneyBox: MoneyManagable
    fileprivate var beverageManager: FoodManagable
    
    init(dateStandard: Date, temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        storage = BeverageStorage()
        dispensedList = DispensedList()
        moneyBox = MoneyBox()
        beverageManager = BeverageManager(dateStandard: dateStandard,
                              temperatureStandard: temperatureStandard,
                              sugarStandard: sugarStandard,
                              lactoStandard: lactoStandard)
    }
    
    init(storage: Storage, dispensedList: OrderableList, moneyBox: MoneyManagable, beverageManager: FoodManagable) {
        self.storage = storage
        self.dispensedList = dispensedList
        self.moneyBox = moneyBox
        self.beverageManager = beverageManager
    }
    
    func addStock(of item: Shopable) {
        storage.add(item)
    }
    
    func insert(money: Int) {
        moneyBox.update(amount: money)
    }

    func moneyLeft() -> Int {
        return moneyBox.balance()
    }
    
    func buy(item: Shopable) {
        guard item.isPurchashable(with: moneyBox.balance()) else { return }
        
        if let itemToSell = storage.pullOut(type(of: item)) {
            dispensedList.push(item: itemToSell)
            
            let moneyAfterPurchase = item.subtractPrice(from: moneyBox.balance())
            moneyBox.update(to: moneyAfterPurchase)
        }
    }
}

//MARK: - 상품정보 반환 관련 
extension VendingMachine {
    
    func allStocks() -> [ObjectIdentifier: Int] {
        return storage.listTypeCount()
    }
    
    func purchased() -> [Shopable] {
        return dispensedList.listByOrder()
    }
    
    func affordables() -> [ObjectIdentifier] {
        return moneyBox.affordables(fromItemsIn: storage)
    }
    
    func expiredItems() -> [ObjectIdentifier: Int] {
        return beverageManager.expiredItems(fromItemsIn: storage)
    }
    
    func hotItems() -> [ObjectIdentifier] {
        return beverageManager.hotItems(fromItemsIn: storage)
    }
    
    func transportables() -> [ObjectIdentifier] {
        return beverageManager.transportables(fromItemsIn: storage)
    }
    
    func healthyItems() -> [ObjectIdentifier] {
        return beverageManager.healthyItems(fromItemsIn: storage)
    }
}

class CodableVendingMachine: NSObject, NSCoding {
    
    var vendingMachine: VendingMachine?
    
    init(vendingMachine: VendingMachine?) {
        self.vendingMachine = vendingMachine
    }
    
    required init?(coder decoder: NSCoder) {
        guard
            let storage = decoder.decodeObject(forKey: "storage") as? Storage,
            let dispensedList = decoder.decodeObject(forKey: "dispensedList") as? OrderableList,
            let moneyBox = decoder.decodeObject(forKey: "moneyBox") as? MoneyManagable,
            let beverageManager = decoder.decodeObject(forKey: "beverageManager") as? FoodManagable
            else { return nil }
        vendingMachine = VendingMachine(storage: storage, dispensedList: dispensedList, moneyBox: moneyBox, beverageManager: beverageManager)
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(self.vendingMachine?.storage, forKey: "storage")
        encoder.encode(self.vendingMachine?.dispensedList, forKey: "dispensedList")
        encoder.encode(self.vendingMachine?.moneyBox, forKey: "moneyBox")
        encoder.encode(self.vendingMachine?.beverageManager, forKey: "beverageManager")
    }
}
