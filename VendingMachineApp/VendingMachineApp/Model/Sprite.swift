import Foundation

class Sprite: SoftDrink {
    private var container: Container
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparatureOfBeverage: Int, zeroCalories: Bool, container: Container) {
        self.container = container
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparatureOfBeverage: temparatureOfBeverage, zeroCalories: zeroCalories)
    }
    
    enum Container {
        case Bottle
        case Can
    }
}
