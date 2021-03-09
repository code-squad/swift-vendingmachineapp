
import Foundation

class BeverageFactory {
    static func make(beverage: Beverage.Type) -> Beverage {
        return beverage.makeBeverage()
    }
}
