import Foundation

class InsertedMoney: NSObject, NSCoding {
    
    private var insertedMoney: Int
    
    override init() {
        insertedMoney = 0
    }
    
    required init?(coder: NSCoder) {
        insertedMoney = coder.decodeInteger(forKey: "insertedMoney")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(insertedMoney, forKey: "insertedMoney")
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
    
    func compareInsertedMoneyToPrice(price: Int) -> Bool {
        return insertedMoney >= price
    }
}

extension InsertedMoney {
    override var description: String {
        return "\(insertedMoney)"
    }
}
