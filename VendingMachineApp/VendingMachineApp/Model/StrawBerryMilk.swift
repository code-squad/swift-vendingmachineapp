import Foundation

class StrawBerryMilk: Milk, CheckAdditive {
    
    private var additive: String
    
    enum StrawberryCodingKeys: String, CodingKey {
        case additive
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String, additive: String) {
        self.additive = additive
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, farmCode: farmCode)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StrawberryCodingKeys.self)
        additive = try values.decode(String.self, forKey: .additive)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StrawberryCodingKeys.self)
        try container.encode(additive, forKey: .additive)
        try super.encode(to: encoder)
    }
    
    required init?(coder: NSCoder) {
        additive = coder.decodeObject(forKey: "additive") as! String
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(additive, forKey: "additive")
        super.encode(with: coder)
    }
    
    func checkAdditive() -> String {
        return additive
    }
}
