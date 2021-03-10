import Foundation

class StrawBerryMilk: Milk, CheckAdditive {
    
    private var additive: String
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, farmCode: farmCode)
    }
    
    convenience init() {
        self.init(brand: "서울우유", volume: 180, price: 1000, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0, farmCode: "a1234", additive: "Strawberry")
    }
    
    required init?(coder: NSCoder) {
        additive = coder.decodeObject(forKey: "additive") as! String
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(additive, forKey: "additive")
        super.encode(with: coder)
    }
    
    func checkAdditive() -> String {
        return additive
    }
}
