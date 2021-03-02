import Foundation

class Top: Coffee, IsDairyProducts {
    
    private var dairyProducts: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparatureOfBeverage: Int, decaffeinated: Bool, dairyProducts: Bool) {
        self.dairyProducts = dairyProducts
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparatureOfBeverage: temparatureOfBeverage, decaffeinated: decaffeinated)
    }
    
    func isDiaryProducts() -> Bool {
        return dairyProducts
    }
}
