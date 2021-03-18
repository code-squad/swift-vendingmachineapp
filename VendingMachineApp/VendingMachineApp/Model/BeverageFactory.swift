import Foundation

struct BeverageFactory {
    
    static func typeToInstance(product: Beverage.Type) -> Beverage {
        let beverage = menuList().filter { type(of: $0) == product }
        return beverage.first!
    }
    
    static func menuList() -> [Beverage] {
        return [ChocolateMilk(), StrawBerryMilk(), Coke(), Sprite(), Top(), Cantata()]
    }
}
