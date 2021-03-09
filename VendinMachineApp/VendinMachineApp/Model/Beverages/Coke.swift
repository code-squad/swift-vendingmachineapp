
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
    
    class override func makeBeverage() -> Beverage {
        return Coke(brand: "코카콜라", size: 190, price: 1500, name: "코카콜라제로", package: Can(), calories: 0)
    }
    
    func isLowCalories(standard: Int) -> Bool {
        return self.calories < standard ? true : false
    }
    
}

