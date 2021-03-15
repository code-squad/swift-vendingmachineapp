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
        NotificationCenter.default.post(name: VendingMachine.sharedInstance().updateInsertedMoney, object: self, userInfo: nil)
    }
    
    func resetMoeny() {
        insertedMoney = 0
    }
    
}

extension InsertedMoney {
    override var description: String {
        return "\(insertedMoney)"
    }
}
