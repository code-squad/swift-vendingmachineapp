import Foundation

class VendingMachine: NSObject, NSCoding {
    
    var insertedMoney: InsertedMoney
    var beverages: Beverages
    
    override private init() {
        insertedMoney = InsertedMoney()
        beverages = Beverages()
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
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(insertedMoney, forKey: "insertedMoney")
        coder.encode(beverages, forKey: "beverages")
    }
    
    func addBeverage(beverage: Beverage) {
        beverages.append(from: beverage)
        NotificationCenter.default.post(name: .updateBeverages, object: nil, userInfo: nil)
    }
    
    func getTheMoney(from customer: Int) {
        insertedMoney.insertMoney(from: customer)
        NotificationCenter.default.post(name: .updateInsertedMoney, object: nil, userInfo: nil)
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
    
    func buyingList(productName: String) -> [Beverage] {
        var buyingList = [Beverage]()
        beverages.forEachBeverage{
            if $0.sellingBeverageList(compare: productName){
                if let item = buyBeverage(product: $0) {
                    buyingList.append(item)
                }
            }
        }
        return buyingList
    }
    
    func buyBeverage(product: Beverage)  -> Beverage? {
        if product.affordableForBeverage(money: insertedMoney) {
            beverages.removeProduct(product)
            insertedMoney.afterBuyingProduct(minus: product.price)
            NotificationCenter.default.post(name: .updateBeverages, object: nil, userInfo: nil)
            NotificationCenter.default.post(name: .updateInsertedMoney, object: nil, userInfo: nil)
            return product
        }
        return nil
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
        NotificationCenter.default.post(name: .updateInsertedMoney, object: nil, userInfo: nil)
    }
    
    func resetBeverages() {
        beverages.resetStock()
        NotificationCenter.default.post(name: .updateBeverages, object: nil, userInfo: nil)
    }
}

extension Notification.Name {
    static let updateInsertedMoney = Notification.Name("updateInsertedMoney")
    static let updateBeverages = Notification.Name("updateBeverages")
}
