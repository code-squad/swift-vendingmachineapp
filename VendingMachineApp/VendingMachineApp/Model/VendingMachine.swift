//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var storage: Storage
    private var dispensedList: OrderableList
    private var moneyBox: MoneyManagable
    private var beverageManager: FoodManagable
    
    init(storage: Storage, dispensedList: OrderableList, moneyBox: MoneyManagable, beverageManager: FoodManagable) {
        self.storage = storage
        self.dispensedList = dispensedList
        self.moneyBox = moneyBox
        self.beverageManager = beverageManager
    }
    
    enum NotiKeys {
        static let stockListUpdate = Notification.Name("stockListUpdate")
        static let balanceUpdate = Notification.Name("balanceUpdate")
    }
    
    func addStock(of item: Shopable) {
        storage.add(item)
        NotificationCenter.default.post(name: NotiKeys.stockListUpdate, object: nil, userInfo: nil)
    }
    
    func insert(money: Int) {
        moneyBox.update(amount: money)
        NotificationCenter.default.post(name: NotiKeys.balanceUpdate, object: nil, userInfo: nil)
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
