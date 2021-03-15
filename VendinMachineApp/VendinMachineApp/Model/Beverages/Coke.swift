
import Foundation

class Coke : Soda, Calorie {
    
    private var calories: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, transparentable: Bool, calories: Int) {
        self.calories = calories
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, transparentable: transparentable)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, transparentable: Bool, calories: Int) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), transparentable: transparentable, calories: calories)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.calories, forKey: "cokeCalories")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.calories = coder.decodeInteger(forKey: "cokeCalories")
        super.init(coder: coder)
    }
    
    class override func makeBeverage() -> Beverage {
        return Coke(brand: "코카콜라", size: 190, price: 1500, name: "코카콜라제로", transparentable: false, calories: 0)
    }
    
    func isLowCalories(standard: Int) -> Bool {
        return self.calories < standard ? true : false
    }
    
}

