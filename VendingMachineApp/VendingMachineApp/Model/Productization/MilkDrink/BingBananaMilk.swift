import Foundation

class BingBananaMilk: Milk, Productization {
    enum Target: String {
        case all
        case forKids = "For Kids"
    }
    
    private var target: Target
    
    init(brand: String, capacity: Int, price: Int, name: String, fat: Double, target: Target, manufactured: Date, temperature: Double, calorie: Double) {
        self.target = target
        
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   fat: fat,
                   manufactured: manufactured,
                   temperature: temperature,
                   calorie: calorie)
    }
    
    init(target: Target, manufactured: Date) {
        self.target = target
        
        super.init(brand: "빙그레",
                   capacity: 240,
                   price: 1150,
                   name: target == .forKids ? "빙그레 바나나우유 \(self.target.rawValue)" : "빙그레 바나나우유",
                   fat: 8,
                   manufactured: manufactured,
                   temperature: 8,
                   calorie: 210)
    }
    
    required convenience init() {
        self.init(brand: "빙그레",
                  capacity: 240,
                  price: 1150,
                  name: "빙그레 바나나우유",
                  fat: 8,
                  target: .all,
                  manufactured: Date(),
                  temperature: 7,
                  calorie: 210)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.target, forKey: "bananaTarger")
    }
    
    required init?(coder: NSCoder) {
        self.target = coder.decodeObject(forKey: "bananaTarger") as? Target ?? .all
        super.init(coder: coder)
    }
    
    func validManufactured(with date: Date) -> Bool {
        return isDrinkableFromManufactured(pastDate: 14, compareDate: date)
    }
}
