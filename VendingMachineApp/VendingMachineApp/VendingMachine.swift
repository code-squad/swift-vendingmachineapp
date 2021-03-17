//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class VendingMachine: NSObject,VendingMachineManagable, NSCoding {
    
    enum NotificationName {
        static let didChangeMoney = Notification.Name("didChangeMoney")
        static let didChangeInventory = Notification.Name("didChangeInventory")
        static let didUpdatePurchseHistory = Notification.Name("didUpdatePurchseHistory")
    }
    
    private var moneyManager: MoneyManagable
    private var inventoryManager: InventoryManagable
    private var purchaseHistoryManager: PurchaseHistoryManagable
    private let beverageMapper: BeverageMapperable
    private let moneyMapper: MoneyMapperable
    
    init(moneyManager: MoneyManagable, inventoryManager: InventoryManagable, purchaseHistoryManager: PurchaseHistoryManagable, beverageMapper: BeverageMapperable, moneyMapper: MoneyMapperable) {
        self.moneyManager = moneyManager
        self.inventoryManager = inventoryManager
        self.purchaseHistoryManager = purchaseHistoryManager
        self.beverageMapper = beverageMapper
        self.moneyMapper = moneyMapper
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.moneyManager, forKey: "moneyManager")
        coder.encode(self.inventoryManager, forKey: "inventoryManager")
        coder.encode(self.purchaseHistoryManager, forKey: "purchaseHistoryManager")
    }
    
    required convenience init?(coder: NSCoder) {
        let moneyManager = coder.decodeObject(forKey: "moneyManager") as! MoneyManagable
        let inventoryManager = coder.decodeObject(forKey: "inventoryManager") as! InventoryManagable
        let purchaseHistoryManager = coder.decodeObject(forKey: "purchaseHistoryManager") as! PurchaseHistoryManagable
        let beverageMapper = BeverageMapper(beverageTypes: [Banana.self, Strawberry.self, TOP.self, Cantata.self, Cola.self, Cider.self])
        let moneyMapper = MoneyMapper(moneyInputTypes: [Money.Input.oneThousand, Money.Input.fiveThousand])
        self.init(moneyManager: moneyManager, inventoryManager: inventoryManager, purchaseHistoryManager: purchaseHistoryManager, beverageMapper: beverageMapper, moneyMapper: moneyMapper)
    }
    
    func readBalance() -> Int {
        return moneyManager.readBalance()
    }
    
    func increaseBalance(_ index: Int) {
        guard let moneyInputType = self.mappingIndexToMoneyInput(by: index) else { return }
        moneyManager.increaseBalance(moneyInputType)
        NotificationCenter.default.post(name: NotificationName.didChangeMoney, object: self)
    }
    
    func readInventoryCount(index: Int) -> Int {
        guard let beverageType = mappingIndexToBeverageType(by: index) else { return 0 }
        return inventoryManager.readInventoryCount(beverageType: beverageType)
    }
    
    func purchaseBeverage(beverageType: Beverage.Type) {
        guard inventoryManager.readInventoryCount(beverageType: beverageType) != 0 else { return }
        guard inventoryManager.isPurchasableBeverage(balance: moneyManager.readBalance(),
                                                     beverageType: beverageType) else { return }
        if let purchased: Beverage = inventoryManager.removeBeverageInInventoryBox(beverageType: beverageType) {
            self.purchaseHistoryManager.addPurchased(beverageType)
            self.moneyManager.decreaseBalance(purchased.price)
            NotificationCenter.default.post(name: VendingMachine.NotificationName.didUpdatePurchseHistory, object: self)
        }
    }
    
    func readInventores() -> [ObjectIdentifier : [Beverage]] {
        return inventoryManager.readInventores()
    }
    
    func readPurchased() -> InventoryManagable {
        return self.purchaseHistoryManager.readPurchased()
    }
    
    func addBeverage(_ beverageType: Beverage.Type) {
        inventoryManager.addBeverage(beverageType)
        NotificationCenter.default.post(name: NotificationName.didChangeInventory, object: nil)
    }
    
    func mappingIndexToBeverageType(by index: Int) -> Beverage.Type? {
        return self.beverageMapper.mapping(by: index)
    }
    
    func mappingIndexToMoneyInput(by index: Int) -> Money.Input? {
        return self.moneyMapper.mapping(by: index)
    }
}
