import Foundation

class InsertedMoney: Codable {
    
    private var insertedMoney: Int
    
    init() {
        insertedMoney = 0
    }
    
    func insertMoney(from customer: Int) {
        insertedMoney += customer
    }
    
    func compareMoney(to price: Int) -> Bool {
        return insertedMoney >= price
    }
    
    func afterBuyingProduct(minus price: Int) {
        insertedMoney -= price
    }
    
    func resetMoeny() {
        insertedMoney = 0
    }
}

extension InsertedMoney: CustomStringConvertible {
    var description: String {
        return "\(insertedMoney)"
    }
}
