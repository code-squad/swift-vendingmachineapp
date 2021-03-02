import Foundation

class Cantata: Coffee, IsDairyProducts {
    
    private var dairyProducts: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, decaffeinated: Bool, dairyProducts: Bool) {
        self.dairyProducts = dairyProducts
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, decaffeinated: decaffeinated)
    }
    
    func isDiaryProducts() -> Bool {
        return dairyProducts
    }
}
