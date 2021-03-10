import Foundation

protocol DrinkProduceable {
    static func makeDrink(of type: Drink.Type, manufactured: Date) -> Drink?
}
