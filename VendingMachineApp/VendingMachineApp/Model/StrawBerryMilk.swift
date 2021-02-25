import Foundation

class StrawBerryMilk: Milk {
    
    private var additive: String
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, farmCode: String, sellByDate: Date, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, farmCode: farmCode, sellByDate: sellByDate)
    }
    
    func checkAdditive() -> String {
        return additive
    }
}
