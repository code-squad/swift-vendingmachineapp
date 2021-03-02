import Foundation

struct VendingMachine {
    var insertedMoney: InsertedMoney
    var beverages: Beverages
    
    init() {
        insertedMoney = InsertedMoney()
        beverages = Beverages()
    }
    
    let beverageList = [ChocolateMilk(brand: .namyang, volume: 180, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparatureOfBeverage: 0, farmCode: "1111", additive: "Chocolate"),
                        StrawBerryMilk(brand: .seoul, volume: 180, price: 700, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), calories: 90, temparatureOfBeverage: 0, farmCode: "1111", additive: "StrawBerry"),
                        Coke(brand: .coca, volume: 250, price: 1500, productName: "코카콜라 제로", manufacturedDay: Date(), sellByDate: Date(), calories: 0, temparatureOfBeverage: 0, zeroCalories: true, flavor: .Original),
                        Sprite(brand: .coca, volume: 190, price: 340, productName: "스프라이트", manufacturedDay: Date(), sellByDate: Date(), calories: 90, temparatureOfBeverage: 0, zeroCalories: false, container: .Can),
                        Top(brand: .maxim, volume: 380, price: 990, productName: "맥심TOP", manufacturedDay: Date(), sellByDate: Date(), calories: 80, temparatureOfBeverage: 100, decaffeinated: false, dairyProducts: false),
                        Cantata(brand: .lotte, volume: 500, price: 2000, productName: "칸타타콘트라베이스블랙", manufacturedDay: Date(), sellByDate: Date(), calories: 20, temparatureOfBeverage: 100, decaffeinated: true, dairyProducts: false)]
    
    mutating func addBeverage(beverage: Beverage) {
        beverages.append(from: beverage)
    }
    
    mutating func getTheMoney(from customer: Int) {
        insertedMoney.insertMoney(from: customer)
    }
    
    func nowAvailableList() -> [Beverage] {
        var availableList = [Beverage]()
        beverages.forEachBeverage{
            if $0.availableForBeverage() {
                availableList.append($0)
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
    
    func stockOfBeverages() -> [String: Int] {
        return beverages.countOfBeverages()
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
    
    func hotBeverages() -> [Beverage] {
        var hotProducts = [Beverage]()
        beverages.forEachBeverage{
            if $0.isHotBeverage() {
                hotProducts.append($0)
            }
        }
        return hotProducts
    }
}

