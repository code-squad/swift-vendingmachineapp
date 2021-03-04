import Foundation

protocol CheckBeverageInfo {
    func validate(with date: Date) -> Bool
    func isHotBeverage(over: Int) -> Bool
    func isLowCalorie(under: Int) -> Bool
}
