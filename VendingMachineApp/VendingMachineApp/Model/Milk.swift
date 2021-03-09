import Foundation

class Milk: Beverage {
    
    private var farmCode: String
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    required init?(coder: NSCoder) {
        farmCode = coder.decodeObject(forKey: "farmCode") as! String
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(farmCode, forKey: "farmCode")
        super.encode(with: coder)
    }
    
    func origin() -> String {
        return farmCode
    }
    
}
