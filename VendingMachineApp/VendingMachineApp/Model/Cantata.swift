import Foundation

class Cantata: Coffee, IsDairyProducts {
    
    private var dairyProducts: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, lowCalories: Bool, isHot: Bool, decaffeinated: Bool, dairyProducts: Bool) {
        self.dairyProducts = dairyProducts
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, lowCalories: lowCalories, isHot: isHot, decaffeinated: decaffeinated)
    }
    
    func isDiaryProducts() -> Bool {
        return dairyProducts
    }
}
