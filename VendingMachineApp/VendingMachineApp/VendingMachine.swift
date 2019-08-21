import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
    
    case invalidItemName
    
    case noPermission
}

class VendingMachine: NSObject, NSCoding {
    
    static var shared = VendingMachine()
    
    //MARK: 속성
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = Inventory()
    
    override init() {
        super.init()
    }
    
    //MARK: NSCoding
    
    struct PropertyKey {
        static let inventory = "inventory"
        static let coinsDeposited = "coinsDeposited"
        static let purchasedItems = "purchasedItems"
    }
    
    static let UserDefaultsKey = "VendingMachine"
    
    func encode(with coder: NSCoder) {
        coder.encode(inventory, forKey: PropertyKey.inventory)
        coder.encode(coinsDeposited, forKey: PropertyKey.coinsDeposited)
        coder.encode(purchasedItems, forKey: PropertyKey.purchasedItems)
    }
    
    required init?(coder: NSCoder) {
        guard let inventory = coder.decodeObject(forKey: PropertyKey.inventory) as? Inventory else {
            return nil
        }
        let coinsDeposited = coder.decodeInteger(forKey: PropertyKey.coinsDeposited)
        guard let purchasedItems = coder.decodeObject(forKey: PropertyKey.purchasedItems) as? Inventory else {
            return nil
        }
        self.inventory = inventory
        self.coinsDeposited = coinsDeposited
        self.purchasedItems = purchasedItems
    }
    
    
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
        let sampleMaker = SampleBeverageItemMaker()
        let sampleBeverages = sampleMaker.samples()
        sampleBeverages.forEach { addBeverageType($0) }
    }
    
    //MARK: 연산 프로퍼티
    
    var purchasableItems: [BeverageItem] {
        return inventory.allBeverages.filter { $0.price <= coinsDeposited }
    }
}
