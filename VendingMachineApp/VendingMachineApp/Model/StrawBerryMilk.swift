import Foundation

class StrawBerryMilk: Milk, CheckAdditive {
    
    private var additive: String
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, lowCalories: Bool, isHot: Bool, farmCode: String, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, lowCalories: lowCalories, isHot: isHot, farmCode: farmCode)
    }
    
    func checkAdditive() -> String {
        return additive
    }
}
