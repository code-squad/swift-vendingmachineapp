
import Foundation

class Coke : Soda, Calorie {
    
    private var calories: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, package: Package, calories: Int) {
        self.calories = calories
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, package: package)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, package: Package, calories: Int) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), package: package, calories: calories)
    }
    
    func isLowCalories(standard: Int) -> Bool {
        return self.calories < standard ? true : false
    }
    
}

