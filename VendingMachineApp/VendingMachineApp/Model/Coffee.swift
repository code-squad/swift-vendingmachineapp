import Foundation

class Coffee:Beverage {
    
    private var decaffeinated: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, name: String, manufacturedDay: Date, decaffeinated: Bool) {
        self.decaffeinated = decaffeinated
        super.init(brand: brand, volume: volume, price: price, productName: name, manufacturedDay: manufacturedDay)
    }
    
    func discriminateDecaffeinated () -> String {
        if decaffeinated { return "YES" }
        else { return "NO" }
    }
}
