import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
    
    case noPermission
}

class VendingMachine {
    
    enum Mode {
        case administrator
        case user
    }
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = [Beverage]()
    private(set) var mode: Mode
    
    init(mode: Mode = .user) {
        self.mode = mode
    }
    
    func switchMode(to mode: Mode) {
        self.mode = mode
    }
    
    var isAdministrator: Bool {
        return mode == .administrator
    }
    
    func insertCoins(_ coins: Coin) {
        coinsDeposited += coins
    }
    
    func vend(itemNamed name: String) throws -> Beverage {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price! <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price! - coinsDeposited)
        }
        
        coinsDeposited -= item.price!
        let itemVended = inventory[name]!.removeFirst()
        purchasedItems.append(itemVended)
        return itemVended
    }
    
    var availableItems: [String] {
        return inventory.filter { (_, item) in
            item.price! <= coinsDeposited
            }.keys.map { $0 }
    }
    
    var hotBeverages: [String] {
        return inventory.hotBeverages
    }
    
    var expiredBeverages: [Beverage] {
        return inventory.expiredBeverages
    }
    
    func addItem(_ beverage: Beverage) throws {
        guard isAdministrator else {
            throw VendingMachineError.noPermission
        }
        inventory.addItem(beverage)
    }
    
    func addItems(_ beverages: [Beverage]) throws {
        try beverages.forEach { try addItem($0) }
    }
    
    func remove(itemNamed name: String) throws -> Beverage {
        guard isAdministrator else {
            throw VendingMachineError.noPermission
        }
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        return inventory[name]!.removeFirst()
    }
}
