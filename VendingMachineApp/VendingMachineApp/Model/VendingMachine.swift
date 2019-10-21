//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by CHOMINJI on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias UserMode = Executable & Userable
typealias ManagerMode = Executable & Managerable

protocol Executable {
    func showBalance(with show: (Int) -> Void)
    func showInventory(with form: InventoryInfo)
    func fetchBeverage(at index: Int) -> Beverage?
}

protocol Managerable {
    func addStock(of beverage: Beverage, count: Int)
    func takeOutStock(of beverage: Beverage, count: Int)
    func fetchFilteredBeverages(by condition: Item.Condition) -> [Beverage]
    func fetchPurchaseHistory() -> [Beverage]
}

protocol Userable {
    func insertMoney(amount: Int) -> Bool
    func purchase(beverage: Beverage, completion: (String, Int) -> Void) -> Beverage?
}

protocol VendingMachineType {
    var beverages: [Item] { get }
    func insertMoney(amount: Int) -> Bool
    func showInventory(with form: InventoryInfo)
    func showBalance(with show: (Int) -> Void)
    func addStock(of beverage: Beverage, count: Int)
    func fetchBeverage(at index: Int) -> Beverage?
}

let vendingMachineID = "VendingMachine"

class VendingMachine: NSObject, NSCoding, VendingMachineType {
    static let sharedInstance: VendingMachineType = {
        let manager = UserDefaultManager<VendingMachineType>(key: vendingMachineID)
        if let loaded = manager.load() {
            return loaded
        } else {
            let allBeverages = [[StrawberryMilk(), StrawberryMilk()],
                        [ChocolateMilk(), ChocolateMilk(), ChocolateMilk(), ChocolateMilk()],
                        [Coke()],
                        [Americano(), Americano(), Americano()]]
            let sample = VendingMachine(storage: Storage(allBeverages: allBeverages))
            return sample
        }
    }()
    
    var balance = 0
    var storage: Storage
    var purchaseHistory: [Beverage] = []
    
    var beverages: [Item] {
        return storage.beverages
    }
    
    private init(storage: Storage) {
        self.storage = storage
    }
    
    enum Keys: String {
        case balance = "Balance"
        case storage = "Storage"
        case purchaseHistory = "PurchaseHistory"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(balance, forKey: Keys.balance.rawValue)
        coder.encode(storage, forKey: Keys.storage.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.balance = coder.decodeInteger(forKey: Keys.balance.rawValue)
        self.storage = coder.decodeObject(forKey: Keys.storage.rawValue) as! Storage
    }
    
    func fetchBeverage(at index: Int) -> Beverage? {
        return storage.fetchBeverage(at: index)
    }
    /// 잔액을 보여준다.
    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }
    
    /// 재고를 출력한다.
    func showInventory(with form: InventoryInfo) {
        storage.showAllList(with: form)
    }
}

extension VendingMachine: Userable {
    /// 자판기 금액을 원하는 금액만큼 올린다.
    func insertMoney(amount: Int) -> Bool {
        guard amount > 0 else {
            return false
        }
        balance += amount
        return true
    }
    
    /// 음료수를 구매한다.
    func purchase(beverage: Beverage, completion: (String, Int) -> Void) -> Beverage? {
        let purchasableBeverages = fetchPurchasableBeverages()
        guard purchasableBeverages.contains(beverage) else {
            return nil
        }
        storage.remove(beverage, count: 1)
        purchaseHistory.append(beverage)
        balance -= beverage.itemPrice
        completion(beverage.itemName, beverage.itemPrice)
        return beverage
    }
    
    /// 현재 금액으로 구매 가능한 음료수 목록을 리턴한다.
    func fetchPurchasableBeverages() -> [Beverage] {
        return storage.filter(by: .purchasable(balance))
    }
}

extension VendingMachine: Managerable {
    ///특정 상품 인스턴스를 넘겨서 재고를 추가한다.
    func addStock(of beverage: Beverage, count: Int) {
        storage.append(beverage, count: count)
    }
    
    /// 특정 상품 인스턴스를 넘겨서 재고를 삭제한다.
    func takeOutStock(of beverage: Beverage, count: Int = 0) {
        storage.remove(beverage, count: count)
    }
    
    /// 조건에 따른 음료를 리턴한다.
    func fetchFilteredBeverages(by condition: Item.Condition) -> [Beverage] {
        return storage.filter(by: condition)
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴한다.
    func fetchPurchaseHistory() -> [Beverage] {
        return purchaseHistory
    }
}
