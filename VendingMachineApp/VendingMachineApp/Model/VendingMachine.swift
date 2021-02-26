import Foundation

struct VendingMachine {
    private var insertedMoney: Int
    private var numsOfBeverages: Int
    private var beverages: Beverages
    
    mutating func addBeverage(beverage: Beverage) {
        beverages.append(from: beverage)
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
