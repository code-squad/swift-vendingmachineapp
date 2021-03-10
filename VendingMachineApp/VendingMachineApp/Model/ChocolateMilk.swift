import Foundation

class ChocolateMilk: Milk, CheckAdditive {
    
    private var additive: String
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, farmCode: farmCode)
    }
    
    convenience init() {
        self.init(brand: "남양유업", volume: 200, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0, farmCode: "f1234", additive: "Chocolate")
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
