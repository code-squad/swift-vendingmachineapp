import Foundation

struct VendingMachine: Codable {
    var insertedMoney: InsertedMoney
    var beverages: Beverages
    
    enum VendingMachineCodingKey: String, CodingKey {
        case insertedMoney
        case beverages
    }
    
    init() {
        insertedMoney = InsertedMoney()
        beverages = Beverages()
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: VendingMachineCodingKey.self)
        insertedMoney = try values.decode(InsertedMoney.self, forKey: .insertedMoney)
        beverages = try values.decode(Beverages.self, forKey: .beverages)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: VendingMachineCodingKey.self)
        try container.encode(insertedMoney, forKey: .insertedMoney)
        try container.encode(beverages, forKey: .beverages)
    }
    
    mutating func addBeverage(beverage: Beverage) {
        beverages.append(from: beverage)
    }
    
    mutating func getTheMoney(from customer: Int) {
        insertedMoney.insertMoney(from: customer)
    }
    
    func nowAvailableList() -> [Beverage] {
        var availableList = [Beverage]()
        beverages.forEachBeverage { beverage in
            if beverage.availableForBeverage() {
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
        if product.availableForBeverage() {
            beverages.removeProduct(product)
            product.afterBuyingBeverage()
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
}
