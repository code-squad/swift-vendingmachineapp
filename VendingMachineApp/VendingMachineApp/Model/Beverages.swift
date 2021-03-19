import Foundation

class Beverages: NSObject, NSCoding {
    var beverages: [Beverage]
    
    override init() {
        beverages = [Beverage]()
    }
    
    required init?(coder: NSCoder) {
        beverages = coder.decodeObject(forKey: "beverages") as! [Beverage]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: "beverages")
    }
    
    func append(from beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func forEachBeverage(_ transform: (Beverage)->()) {
        beverages.forEach { transform($0) }
    }
    
    func removeProduct(_ product: Beverage) {
        var beverage: Beverage!
        beverages.forEach {
            if $0 == product {
                beverage = $0
            }
        }
        beverages.remove(at: beverages.firstIndex(of: beverage)!)
    }
    
    func stockListOfBeverages() -> [ObjectIdentifier: Int]{
        var stockList = [ObjectIdentifier:Int]()
        for beverage in beverages {
            let productName = ObjectIdentifier(type(of:beverage))
            if stockList[productName] == nil {
                stockList[productName] = 1
            } else {
                stockList[productName]! += 1
            }
        }
        return stockList
    }
    
    func stockOfEach(beverage: Beverage) -> Int{
        return beverages.filter { $0 == beverage}.count
    }
    
    func resetStock() {
        beverages.removeAll()
    }
}

extension Beverages {
    override var description: String {
        return "\(beverages)"
    }
}
