import Foundation

class InsertedMoney {
    
    private var insertedMoney: Int
    
    init() {
        insertedMoney = 0
    }
    
    func insertMoney(from customer: Int) {
        insertedMoney += customer
    }
    
    func compareMoney(to price: Int) -> Bool {
        return insertedMoney >= price ? true : false
    }
    
    func afterBuyingProduct(minus price: Int) {
        insertedMoney -= price
    }
}

extension InsertedMoney: CustomStringConvertible {
    var description: String {
        return "\(insertedMoney)"
    }
}
