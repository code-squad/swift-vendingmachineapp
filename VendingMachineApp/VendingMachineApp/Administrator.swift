import Foundation

protocol Administrator {
    func removeItem()
    
    func addItem()
}

protocol BeverageMakable {
    func makeBeverage() -> BeverageItem
    
    func makeBeverageManual() -> BeverageItem
    
    func makeBeverageInOptions() -> BeverageItem
}
