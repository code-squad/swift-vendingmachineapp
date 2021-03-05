import Foundation

class Coke: SoftDrink {
    private var flavor : Flavor
    
    enum CokeCodingKeys: String, CodingKey {
        case flavor
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, zeroCalories: zeroCalories)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CokeCodingKeys.self)
        flavor = try values.decode(Flavor.self, forKey: .flavor)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CokeCodingKeys.self)
        try container.encode(flavor, forKey: .flavor)
        try super.encode(to: encoder)
    }
    
    enum Flavor: String, Codable {
        case Lime
        case Cherry
        case Original
    }
}
