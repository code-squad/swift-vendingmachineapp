
import Foundation

class Latte : Coffee, Calorie {
    
    private var calories: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, temperature: Int, country: Country, calories: Int) {
        self.calories = calories
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, temperature: temperature, country: country)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, temperature: Int, country: Country, calories: Int) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), temperature: temperature, country: country, calories: calories)
    }
    
    func isLowCalories(standard: Int) -> Bool {
        return self.calories < standard ? true : false
    }
}
