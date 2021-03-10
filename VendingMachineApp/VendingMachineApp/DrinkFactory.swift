import Foundation

class DrinkFactory: DrinkProduceable {    
    static public func makeDrink(of type: Drink.Type, manufactured: Date = Date()) -> Drink? {
        guard let productType = type as? Productization.Type else { return nil }
        guard let drink = productType.init() as? Drink else { return nil }
        return drink
    }
}
