import Foundation

struct BeverageFactory {
    private(set) var chocoMilk: Beverage
    private(set) var strawberryMilk: Beverage
    private(set) var coke: Beverage
    private(set) var sprite: Beverage
    private(set) var top: Beverage
    private(set) var cantata: Beverage
    
    init() {
        chocoMilk = ChocolateMilk()
        strawberryMilk = StrawBerryMilk()
        coke = Coke()
        sprite = Sprite()
        top = Top()
        cantata = Cantata()
    }
    
    
}
