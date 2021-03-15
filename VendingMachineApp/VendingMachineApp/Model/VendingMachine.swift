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
        static let dispensdListUpdate = Notification.Name("dispensedListUpdate")
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
            NotificationCenter.default.post(name: NotiKeys.stockListUpdate, object: nil, userInfo: nil)
            
            dispensedList.push(item: itemToSell)
            NotificationCenter.default.post(name: NotiKeys.dispensdListUpdate, object: nil, userInfo: nil)
            
            let moneyAfterPurchase = item.subtractPrice(from: moneyBox.balance())
            moneyBox.update(to: moneyAfterPurchase)
            NotificationCenter.default.post(name: NotiKeys.balanceUpdate, object: nil, userInfo: nil)
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

//MARK: - Protocols
protocol Shopable {
    
    init()
    
    func isPurchashable(with money: Int) -> Bool
    
    func subtractPrice(from balance: Int) -> Int
    
}

protocol Storage {
    
    func add(_ item: Shopable)
    
    func pullOut(_ itemType: Shopable.Type) -> Shopable?
    
    func listTypeOnly() -> [ObjectIdentifier]
    
    func listTypeOnly(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier])) -> [ObjectIdentifier]
    
    func listTypeCount() -> [ObjectIdentifier: Int]
    
    func listTypeCount(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier: Int])) -> [ObjectIdentifier: Int]
    
}

protocol OrderableList {
    
    func push(item: Shopable)
    
    func listByOrder() -> [Shopable]
}

protocol MoneyManagable {
    
    func update(amount: Int)
    
    func update(to money: Int)
    
    func balance() -> Int
    
    func affordables(fromItemsIn storage: Storage) -> [ObjectIdentifier]
}

protocol ProductManagable {
    
    func expiredItems(fromItemsIn storage: Storage) -> [ObjectIdentifier: Int]
    
}

protocol FoodManagable: ProductManagable {
    
    func hotItems(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
    func transportables(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
    func healthyItems(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
}
