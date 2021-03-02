import Foundation

class ChocolateMilk: Milk, CheckAdditive {
    
    private var additive: String
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, farmCode: farmCode)
    }
    
    func checkAdditive() -> String {
        return additive
    }
}
