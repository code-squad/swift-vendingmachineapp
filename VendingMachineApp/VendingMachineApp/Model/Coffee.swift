import Foundation

class Coffee:Beverage {
    
    private var decaffeinated: Bool
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, decaffeinated: Bool) {
        self.decaffeinated = decaffeinated
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    required init?(coder: NSCoder) {
        decaffeinated = coder.decodeBool(forKey: "decaffeinated")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(decaffeinated, forKey: "decaffeinated")
        super.encode(with: coder)
    }
    
    func discriminateDecaffeinated () -> String {
        if decaffeinated { return "YES" }
        else { return "NO" }
    }
}
