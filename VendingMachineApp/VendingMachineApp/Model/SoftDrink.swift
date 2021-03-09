import Foundation

class SoftDrink: Beverage {
    
    private var zeroCalories: Bool
    
    enum SoftDrinkCodingKeys: String, CodingKey {
        case zeroCalories
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool) {
        self.zeroCalories = zeroCalories
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SoftDrinkCodingKeys.self)
        zeroCalories = try values.decode(Bool.self, forKey: .zeroCalories)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SoftDrinkCodingKeys.self)
        try container.encode(zeroCalories, forKey: .zeroCalories)
        try super.encode(to: encoder)
    }
    
    required init?(coder: NSCoder) {
        zeroCalories = coder.decodeObject(forKey: "zeroCalories") as! Bool
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(zeroCalories, forKey: "zeroCalories")
        super.encode(with: coder)
    }
    
    func discriminateZeroCalories() -> String {
        if zeroCalories { return "YES" }
        else { return "NO" }
    }
}
