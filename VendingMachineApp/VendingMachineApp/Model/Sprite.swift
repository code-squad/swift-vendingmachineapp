import Foundation

class Sprite: SoftDrink {
    private var container: Container
    
    enum SpriteCodingKeys: String, CodingKey {
        case container
    }
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool, container: Container) {
        self.container = container
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, zeroCalories: zeroCalories)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SpriteCodingKeys.self)
        container = try values.decode(Container.self, forKey: .container)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var containers = encoder.container(keyedBy: SpriteCodingKeys.self)
        try containers.encode(container, forKey: .container)
        try super.encode(to: encoder)
    }
    
    required init?(coder: NSCoder) {
        container = coder.decodeObject(forKey: "container") as! Container
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(container, forKey: "container")
        super.encode(with: coder)
    }
    
    enum Container: String, Codable {
        case Bottle
        case Can
    }
}
