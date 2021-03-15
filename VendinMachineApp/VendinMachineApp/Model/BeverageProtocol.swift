
import Foundation

protocol Calorie {
    func isLowCalories(standard: Int) -> Bool
}

protocol Hotable {
    func isHot(standard: Int) -> Bool
}

protocol Drinkable {
    func isDrinkable(on date: Date) -> Bool
}

protocol Shot {
    func isMoreThan(shot: Int) -> Bool
}

protocol Transparentable {
    func isTransparentMaterial() -> Bool
}
