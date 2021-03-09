import Foundation

class Top: Coffee, IsDairyProducts {
    
    private var dairyProducts: Bool
    
    enum TopCodingKey: String, CodingKey {
        case dairyProducts
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, decaffeinated: Bool, dairyProducts: Bool) {
        self.dairyProducts = dairyProducts
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, decaffeinated: decaffeinated)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TopCodingKey.self)
        dairyProducts = try values.decode(Bool.self, forKey: .dairyProducts)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TopCodingKey.self)
        try container.encode(dairyProducts, forKey: .dairyProducts)
        try super.encode(to: encoder)
    }
    
    required init?(coder: NSCoder) {
        dairyProducts = coder.decodeObject(forKey: "dairyProducts") as! Bool
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
