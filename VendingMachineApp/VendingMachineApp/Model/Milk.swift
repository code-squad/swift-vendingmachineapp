import Foundation

class Milk: Beverage {
    
    private var farmCode: String
    
    enum MilkCodingKeys: String, CodingKey {
        case farmCode
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MilkCodingKeys.self)
        farmCode = try values.decode(String.self, forKey: .farmCode)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MilkCodingKeys.self)
        try container.encode(farmCode, forKey: .farmCode)
        try super.encode(to: encoder)
    }
    
    func origin() -> String {
        return farmCode
    }
    
}
