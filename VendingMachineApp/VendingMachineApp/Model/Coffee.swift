import Foundation

class Coffee:Beverage {
    
    private var decaffeinated: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, decaffeinated: Bool) {
        self.decaffeinated = decaffeinated
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    func discriminateDecaffeinated () -> String {
        if decaffeinated { return "YES" }
        else { return "NO" }
    }
}
