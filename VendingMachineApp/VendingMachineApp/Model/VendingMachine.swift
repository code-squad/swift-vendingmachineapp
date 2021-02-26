import Foundation

struct VendingMachine {
    private var insertedMoney: Int
    private var numsOfBeverages: Int
    private var beverages: Beverages
    
    let beverageList = [ChocolateMilk(brand: .namyang, volume: 180, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), lowCalories: false, isHot: false, farmCode: "1111", additive: "Chocolate"),
                        StrawBerryMilk(brand: .seoul, volume: 180, price: 700, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), lowCalories: false, isHot: false, farmCode: "1111", additive: "StrawBerry"),
                        Coke(brand: .coca, volume: 250, price: 1500, productName: "코카콜라 제로", manufacturedDay: Date(), sellByDate: Date(), lowCalories: true, isHot: false, zeroCalories: true, flavor: .Original),
                        Sprite(brand: .coca, volume: 190, price: 340, productName: "스프라이트", manufacturedDay: Date(), sellByDate: Date(), lowCalories: false, isHot: false, zeroCalories: false, container: .Can),
                        Top(brand: .maxim, volume: 380, price: 990, productName: "맥심TOP", manufacturedDay: Date(), sellByDate: Date(), lowCalories: false, isHot: true, decaffeinated: false, dairyProducts: false),
                        Cantata(brand: .lotte, volume: 500, price: 2000, productName: "칸타타콘트라베이스블랙", manufacturedDay: Date(), sellByDate: Date(), lowCalories: true, isHot: false, decaffeinated: true, dairyProducts: false)]
    
    mutating func addBeverage(count: Int) {
        for i in 0..<count {
            let idx = i % beverageList.count
            beverages.append(from: beverageList[idx])
        }
    }
    
    mutating func getTheMoney(from customer: Int) {
        insertedMoney += customer
    }
    
    func nowAvailableList() -> [Beverage] {
        var availableList = [Beverage]()
        beverages.forEachBeverage{
            if $0.checkPrice() <= insertedMoney {
                availableList.append($0)
            }
        }
        return availableList
    }
}

