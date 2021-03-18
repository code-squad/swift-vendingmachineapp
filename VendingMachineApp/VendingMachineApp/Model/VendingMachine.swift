import Foundation

class VendingMachine: NSObject, NSCoding {
    
    var insertedMoney: InsertedMoney
    var beverages: Beverages
    private var purchased: [Beverage]
    
    static let updateInsertedMoney = Notification.Name("updateInsertedMoney")
    static let updateBeverages = Notification.Name("updateBeverages")
    static let updatePurchased = Notification.Name("updatePurchased")
    
    override private init() {
        insertedMoney = InsertedMoney()
        beverages = Beverages()
        purchased = [Beverage]()
    }
    
    private static var sharedVendingMachine = VendingMachine()
    
    static func sharedInstance() -> VendingMachine {
        return sharedVendingMachine
    }
    
    static func loadInstance(_ vendingMachine: VendingMachine) {
        sharedVendingMachine = vendingMachine
    }
    
    required init?(coder: NSCoder) {
        insertedMoney = coder.decodeObject(forKey: "insertedMoney") as! InsertedMoney
        beverages = coder.decodeObject(forKey: "beverages") as! Beverages
        purchased = coder.decodeObject(forKey: "purchased") as? [Beverage] ?? [Beverage]()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(insertedMoney, forKey: "insertedMoney")
        coder.encode(beverages, forKey: "beverages")
        coder.encode(purchased, forKey: "purchased")
    }
    
    func addBeverage(beverage: Beverage) {
        beverages.append(from: beverage)
        NotificationCenter.default.post(name: VendingMachine.updateBeverages, object: self, userInfo: ["BeverageType": type(of: beverage)])
    }
    
    func getTheMoney(from customer: Int) {
        insertedMoney.insertMoney(from: customer)
        NotificationCenter.default.post(name: VendingMachine.updateInsertedMoney, object: self, userInfo: nil)
    }
    
    func nowAvailableList() -> [Beverage] {
        var availableList = [Beverage]()
        beverages.forEachBeverage { beverage in
            if beverage.affordableForBeverage(money: insertedMoney) {
                availableList.append(beverage)
            }
        }
        return availableList
    }
    
    func buyingList() -> [Beverage] {
        return purchased
    }
    
    func lastPurchasedBeverage() -> Beverage? {
        if purchased.isEmpty { return nil }
        return purchased[purchased.endIndex-1]
    }
    
    func buyBeverage(product: Beverage.Type){
        let beverage = typeToInstance(product: product)
        if beverage.affordableForBeverage(money: insertedMoney) {
            beverageInfoAfterBuyingBeverage(of: beverage)
            moneyInfoAfterBuyingBeverage(price: beverage.price)
            purchased.append(beverage)
            NotificationCenter.default.post(name: VendingMachine.updatePurchased, object: self, userInfo: nil)
        }
    }
    
    func moneyInfoAfterBuyingBeverage(price: Int) {
        insertedMoney.afterBuyingProduct(minus: price)
        NotificationCenter.default.post(name: VendingMachine.updateInsertedMoney, object: self, userInfo: nil)
    }
    
    func beverageInfoAfterBuyingBeverage(of beverage: Beverage) {
        beverages.removeProduct(beverage)
        NotificationCenter.default.post(name: VendingMachine.updateBeverages, object: self, userInfo: nil)
    }
    
    func typeToInstance(product: Beverage.Type) -> Beverage {
        let beverage = menuList().filter { type(of: $0) == product }
        return beverage.first!
    }
    
    func nowBalanceOfVendingMachine() -> InsertedMoney{
        return insertedMoney
    }
    
    func stockOf(beverage: Beverage) -> Int {
        return beverages.stockOfEach(beverage: beverage)
    }
    
    func expiredProducts() -> [Beverage] {
        var expired = [Beverage]()
        beverages.forEachBeverage{
            if !$0.validate(with: Date()) {
                expired.append($0)
            }
        }
        return expired
    }
    
    func hotBeverages(temparatue: Int) -> [Beverage] {
        var hotProducts = [Beverage]()
        beverages.forEachBeverage{
            if $0.isHotBeverage(over: temparatue) {
                hotProducts.append($0)
            }
        }
        return hotProducts
    }
    
    func menuList() -> [Beverage] {
        return [ChocolateMilk(), StrawBerryMilk(), Coke(), Sprite(), Top(), Cantata()]
    }
    
    func resetInsertedMoney() {
        insertedMoney.resetMoeny()
        NotificationCenter.default.post(name: VendingMachine.updateInsertedMoney, object: self, userInfo: nil)
    }
    
    func resetBeverages() {
        beverages.resetStock()
        NotificationCenter.default.post(name: VendingMachine.updateBeverages, object: self, userInfo: nil)
    }
    
    func resetPurchased() {
        purchased.removeAll()
        NotificationCenter.default.post(name: VendingMachine.updatePurchased, object: self, userInfo: nil)
    }
    
    func compareProductNameToInstance(name: String) -> Beverage? {
        let beverageList = menuList()
        for beverage in beverageList {
            if beverage.productName == name {
                return beverage
            }
        }
        return nil
    }
}
