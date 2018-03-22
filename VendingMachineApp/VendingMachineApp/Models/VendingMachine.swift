//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachineSetting {
    private let keyProperty: String = "machine"
    
    func save() {
        var data: Data = Data()
        do {
            data = try PropertyListEncoder().encode(VendingMachine.shared())
        } catch {
            print(error.localizedDescription)
        }
        
        UserDefaults.standard.set(data, forKey: keyProperty)
    }
    
    func load() -> VendingMachine {
        var machine: VendingMachine = VendingMachine.shared()

        guard let data = UserDefaults.standard.object(forKey: keyProperty) as? Data else { return machine }
        
        do {
            machine = try PropertyListDecoder().decode(VendingMachine.self, from: data)
            VendingMachine.stored(machine)
        } catch {
            print(error.localizedDescription)
        }
        
        return VendingMachine.shared()
    }
}

final class VendingMachine {
    private static var shareInstance: VendingMachine = VendingMachine()
    private var money: Money {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.money, object: nil)
        }
    }
    
    private var inventory: Inventory {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.inventory, object: nil)
        }
    }
    
    private var salesHistory: SalesHistory {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.salesHistory, object: nil)
        }
    }
    
    init() {
        self.money = Money(0)
        self.inventory = Inventory([])
        self.salesHistory = SalesHistory()
    }
    
    static func shared() -> VendingMachine {
        return shareInstance
    }
    
    static func stored(_ machine: VendingMachine) {
        shareInstance = machine
    }
}

extension VendingMachine: InventoryCountable {
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int {
        return inventory.countBeverage(beverageMenu: beverageMenu)
    }
    
    func countCurrentInventory() -> [BeverageBox] {
        return inventory.fetchListOfBeverage()
    }
    
    func fetchSalesHistory() -> [String] {
        return salesHistory.historyOfSales()
    }
}

extension VendingMachine: Userable {
    func insertMoney(coin: Money) throws {
        money = try money.plus(coin: coin)
    }

    func deductMoney(coin: Money) throws {
        money = try money.subtract(coin: coin)
    }

    func countChange() -> Int {
        return money.countChange()
    }

    func buyBeverage(beverageMenu: BeverageMenu) throws {
        let beverage = beverageMenu.makeInstance()
        salesHistory = salesHistory.addSalesHistory(date: DateUtility.today(), beverageMenu: beverageMenu)
        try deductBeverage(beverageMenu: beverageMenu)
        try deductMoney(coin: beverage.price)
    }
}

extension VendingMachine: MachineManagerable {
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) {
        inventory = inventory.add(beverageMenu: beverageMenu, quantity: quantity)
    }

    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) throws {
        inventory = try inventory.deduct(beverageMenu: beverageMenu, quantity: quantity)
    }
    
    func fetchListOfPurchasableBeverages() -> [BeverageBox] {
        return inventory.fetchListOfBeverage().filter ({
            $0.beverageMenu.makeInstance().price <= money
        })
    }
    
    func fetchListOfHottedBeverage() -> [BeverageMenu] {
        return BeverageMenu.filterHottedBeverages()
    }
    
    func fetchListOfValidDate() -> [BeverageMenu] {
        return BeverageMenu.filterExpireDateOnToday()
    }
}

extension VendingMachine: Codable {
    private enum CodingKeys: CodingKey {
        case money, inventory, salesHistory
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.money = try values.decode(Money.self, forKey: .money)
        self.inventory = try values.decode(Inventory.self, forKey: .inventory)
        self.salesHistory = try values.decode(SalesHistory.self, forKey: .salesHistory)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(money, forKey: .money)
        try container.encode(inventory, forKey: .inventory)
        try container.encode(salesHistory, forKey: .salesHistory)
    }
}
