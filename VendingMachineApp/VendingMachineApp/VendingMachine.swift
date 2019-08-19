import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
    
    case invalidItemName
    
    case noPermission
}

class VendingMachine: NSObject, NSCoding {
    
    //MARK: 속성
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = Inventory()
    
    //MARK: 프로퍼티 키
    
    
    
    //MARK: 메소드
    
    func insertCoins(_ amount: Coin) {
        coinsDeposited += amount
    }
    
    func deductCoins(_ amount: Coin) throws {
        guard amount <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: amount - coinsDeposited)
        }
        coinsDeposited -= amount
    }
    
    func takeItem(named name: String) throws -> Beverage {
        guard let beverage = try inventory[name]?.removeBeverage() else {
            throw VendingMachineError.invalidItemName
        }
        return beverage
    }
    
    func vend(itemNamed name: String) throws -> BeverageItem {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidItemName
        }
        try deductCoins(item.price)
        
        let beverage = try takeItem(named: item.name)
        purchasedItems.addBeverage(beverage, to: item)
        
        return item
    }
    
    func addBeverageType(_ beverage: BeverageItem) {
        inventory.addBeverageItem(beverage)
    }
    
    func addBeverage(_ beverage: Beverage, to item: BeverageItem) {
        inventory.addBeverage(beverage, to: item)
    }
    
    func addBeverages(_ beverages: [Beverage], to item: BeverageItem) {
        beverages.forEach { addBeverage($0, to: item) }
    }
    
    func loadSampleBeverages() {
        let sampleMaker = SampleBeverageMaker()
        let sampleBeverages = sampleMaker.sampleBeverages()
        sampleBeverages.forEach { addBeverageType($0) }
    }
    
    //MARK: 연산 프로퍼티
    
    var purchasableItems: [BeverageItem] {
        return inventory.allBeverages.filter { $0.price <= coinsDeposited }
    }
}
