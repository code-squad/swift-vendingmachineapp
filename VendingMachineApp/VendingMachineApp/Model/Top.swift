import Foundation

class Top: Coffee, IsDairyProducts {
    
    private var dairyProducts: Bool
    
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, decaffeinated: Bool, dairyProducts: Bool) {
        self.dairyProducts = dairyProducts
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, decaffeinated: decaffeinated)
    }
        
    required init?(coder: NSCoder) {
        dairyProducts = coder.decodeBool(forKey: "dairyProducts")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(dairyProducts, forKey: "dairyProducts")
        super.encode(with: coder)
    }
    
    func isDiaryProducts() -> Bool {
        return dairyProducts
    }
}
