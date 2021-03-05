import Foundation

class Coffee:Beverage {
    
    private var decaffeinated: Bool
    
    enum CoffeeCodingKeys: String, CodingKey {
        case decaffeinated
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, decaffeinated: Bool) {
        self.decaffeinated = decaffeinated
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CoffeeCodingKeys.self)
        decaffeinated = try values.decode(Bool.self, forKey: .decaffeinated)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CoffeeCodingKeys.self)
        try container.encode(decaffeinated, forKey: .decaffeinated)
        try super.encode(to: encoder)
    }
    
    func discriminateDecaffeinated () -> String {
        if decaffeinated { return "YES" }
        else { return "NO" }
    }
}
