import Foundation

extension Notification.Name {
    static let reloadCoinsDeposited = Notification.Name("reloadCoinsDeposited")
}
enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
    
    case invalidItemName
    
    case noPermission
}

class VendingMachine {
    
    static let shared = VendingMachine()
    
    //MARK: 속성
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0 {
        didSet {
            NotificationCenter.default.post(name: .reloadCoinsDeposited, object: nil)
        }
    }
    private(set) var purchasedItems = Inventory()
    
    //MARK: NSCoding
    
    struct UserDefaultsKey {
        static let inventory = "inventory"
        static let coinsDeposited = "coinsDeposited"
        static let purchasedItems = "purchasedItems"
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
    
    func saveData() {
        do {
            let inventoryData = try NSKeyedArchiver.archivedData(withRootObject: inventory, requiringSecureCoding: false)
            let purchasedData = try NSKeyedArchiver.archivedData(withRootObject: purchasedItems, requiringSecureCoding: false)
            
            UserDefaults.standard.set(inventoryData, forKey: VendingMachine.UserDefaultsKey.inventory)
            UserDefaults.standard.set(coinsDeposited, forKey: VendingMachine.UserDefaultsKey.coinsDeposited)
            UserDefaults.standard.set(purchasedData, forKey: VendingMachine.UserDefaultsKey.purchasedItems)
        } catch {
            print(error)
            return
        }
    }
    
    func loadData() {
        
        let inventoryObject: Any?
        let purchasedObject: Any?
        
        guard let inventoryData = UserDefaults.standard.data(forKey: VendingMachine.UserDefaultsKey.inventory) else {
            print("인벤토리를 로드할 수 없음")
            return
        }
        let coinsDeposited = UserDefaults.standard.integer(forKey: VendingMachine.UserDefaultsKey.coinsDeposited)
        guard let purchasedData = UserDefaults.standard.data(forKey: VendingMachine.UserDefaultsKey.purchasedItems) else {
            print("구매 목록을 로드할 수 없음")
            return
        }
        do {
            inventoryObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(inventoryData)
            purchasedObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(purchasedData)
            
        } catch {
            print(error)
            return
        }
        
        guard let inventory = inventoryObject as? Inventory else {
            print("인벤토리 타입 변환 실패")
            return
        }
        
        guard let purchasedItems = purchasedObject as? Inventory else {
            print("구매 목록 타입 변환 실패")
            return
        }
        self.inventory = inventory
        self.coinsDeposited = coinsDeposited
        self.purchasedItems = purchasedItems
    }
    
}
