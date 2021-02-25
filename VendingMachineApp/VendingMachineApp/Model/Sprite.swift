import Foundation

class Sprite: SoftDrink {
    private var container: Container
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, zeroCalories: Bool, container: Container) {
        self.container = container
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, zeroCalories: zeroCalories)
    }
    
    enum Container {
        case Bottle
        case Can
    }
}
