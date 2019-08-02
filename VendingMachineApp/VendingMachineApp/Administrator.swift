import UIKit

protocol Administrator {
    func removeItem()
    
    func addItem()
}

protocol BeverageMakable {
    func makeBeverage() -> Beverage
    
    func makeBeverageManual() -> Beverage
    
    func makeBeverageInOptions() -> Beverage
}
