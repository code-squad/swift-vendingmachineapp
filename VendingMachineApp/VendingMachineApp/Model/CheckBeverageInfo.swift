import Foundation

protocol CheckBeverageInfo {
    func validate(with date: Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
