import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
    
    case noPermission
}

class VendingMachine {
    
    
    //MARK: 타입
    
//    enum Mode {
//        case administrator
//        case user
//    }
    
    //MARK: 속성
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = Inventory()
//    private(set) var mode: Mode
    
    //MARK: 초기화
    
//    init(mode: Mode = .user) {
//        self.mode = mode
//    }
    
    //MARK: 메소드
    
//    func switchMode(to mode: Mode) {
//        self.mode = mode
//    }
    
//    var isAdministrator: Bool {
//        return mode == .administrator
//    }
    
    func insertCoins(_ amount: Coin) {
        coinsDeposited += amount
    }
    
    func deductCoins(_ amount: Coin) throws {
        guard amount <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: amount - coinsDeposited)
        }
        coinsDeposited -= amount
    }
    
    func takeItem(named name: String) throws -> Date {
        return try inventory[name].removeBeverage()
    }
    
    func vend(itemNamed name: String) throws -> Beverage {
        
        let beverage = inventory[name]
        
        try deductCoins(beverage.price)
        
        let manufactureDate = try takeItem(named: beverage.name)
        
        purchasedItems.addBeverage(beverage, manufactureDate: manufactureDate)
        
        return beverage
    }
    
    var purchasableItems: [Beverage] {
        return inventory.allBeverages.filter { $0.price <= coinsDeposited }
    }
    
    func addBeverage(_ beverage: Beverage, manufactureDate: Date = Date()) {
        inventory.addBeverage(beverage, manufactureDate: manufactureDate)
    }
    
    func addBeverages(_ beverage: Beverage, manufactureDates: [Date]) throws {
        manufactureDates.forEach { addBeverage(beverage, manufactureDate: $0) }
    }
    
}
