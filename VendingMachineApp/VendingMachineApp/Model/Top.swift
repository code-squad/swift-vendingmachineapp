import Foundation

class Top: Coffee, IsDairyProducts {
    
    private var dairyProducts: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, decaffeinated: Bool, dairyProducts: Bool) {
        self.dairyProducts = dairyProducts
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, decaffeinated: decaffeinated)
    }
    
    func isDiaryProducts() -> Bool {
        return dairyProducts
    }
}
