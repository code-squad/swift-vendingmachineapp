import Foundation

protocol CheckBeverageInfo {
    func validate(with date: Date) -> Bool
    func isHotBeverage() -> Bool
    func isLowCalorie() -> Bool
}
