import Foundation

class BingBananaMilk: Milk, Productization {
    enum Target: String {
        case all = ""
        case forKids = "kids"
    }
    
    private var target: Target
    
    init(brand: String, capacity: Int, price: Int, name: String, fat: Double, target: Target, manufactured: Date, temperature: Double, calorie: Double) {
        self.target = target
        super.init(brand: brand, capacity: capacity, price: price, name: name, fat: fat, manufactured: manufactured, temperature: temperature, calorie: calorie)
    }
    
    init(target: Target, manufactured: Date) {
        self.target = target
        
        super.init(brand: "빙그레",
                   capacity: 240,
                   price: 1150,
                   name: "빙그레 바나나우유",
                   fat: 8,
                   manufactured: manufactured,
                   temperature: 8,
                   calorie: 210)
    }
    
    convenience init() {
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
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 14, compareDate: date)
    }
}
