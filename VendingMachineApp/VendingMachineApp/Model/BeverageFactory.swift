import Foundation

struct BeverageFactory {
    
    private let beverageStorage = [ChocolateMilk(), StrawBerryMilk(), Coke(), Sprite(), Top(), Cantata()]
    
    func typeToInstance(product: Beverage.Type) -> Beverage {
        let beverage = menuList().filter { type(of: $0) == product }
        return beverage.first!
    }
    
    func menuList() -> [Beverage] {
        return [ChocolateMilk(), StrawBerryMilk(), Coke(), Sprite(), Top(), Cantata()]
    }
}
