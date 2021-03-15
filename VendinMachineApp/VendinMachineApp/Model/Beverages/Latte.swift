
import Foundation

class Latte : Coffee, Calorie {
    
    private var calories: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, temperature: Int, country: String, calories: Int) {
        self.calories = calories
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, temperature: temperature, country: country)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, temperature: Int, country: String, calories: Int) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), temperature: temperature, country: country, calories: calories)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.calories, forKey: "latteCalories")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.calories = coder.decodeInteger(forKey: "latteCalories")
        super.init(coder: coder)
    }
    
    class override func makeBeverage() -> Beverage {
        return Latte(brand: "롯데", size: 175, price: 500, name: "레쓰비 모카라떼", temperature: 1, country: "한국", calories: 300)
    }
    
    func isLowCalories(standard: Int) -> Bool {
        return self.calories < standard ? true : false
    }
}
