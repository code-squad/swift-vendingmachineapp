import Foundation

class StrawBerryMilk: Milk, CheckAdditive {
    
    private var additive: String
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, farmCode: farmCode)
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
