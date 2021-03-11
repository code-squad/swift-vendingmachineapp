//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

protocol BeverageProduceable {
    static func produce(of type: Beverage.Type) -> Beverage?
}

protocol BeverageInitable {
    init()
}

class BeverageFactory: BeverageProduceable {
    static func produce(of type: Beverage.Type) -> Beverage? {
        guard let beverageType = type as? BeverageInitable.Type else { return nil }
        guard let beverage = beverageType.init() as? Beverage else { return nil }
        return beverage
    }
}


//class BananaMilkFactory: BeverageProduceable {
//    static func produce() -> Beverage {
//        return Banana(countryOfOrigin: "필리핀")
//    }
//}
//
//class StrawberryMilkFactory: BeverageProduceable {
//    static func produce() -> Beverage {
//        return Strawberry(strawberryContent: 15)
//    }
//}
//
//class ColaFactory: BeverageProduceable {
//    static func produce() -> Beverage {
//        return Cola(transFat: 2)
//    }
//}
//
//class CiderFactory: BeverageProduceable {
//    static func produce() -> Beverage {
//        return Cider(sugars: 32)
//    }
//}
//
//class TopCoffeeFactory: BeverageProduceable {
//    static func produce() -> Beverage {
//        return TOP(taste: .sweatAmericano)
//    }
//}
//
//class CantataCoffeeFactory: BeverageProduceable {
//    static func produce() -> Beverage {
//        return Cantata(milkContent: 15)
//    }
//}

//class BeverageFactory {
//    class func makeBeverage(beverageType: Beverage.Type) -> Beverage? {
//        switch beverageType {
//        case is Banana.Type:
//            return BananaMilkFactory.produce()
//        case is Strawberry.Type:
//            return StrawberryMilkFactory.produce()
//        case is TOP.Type:
//            return TopCoffeeFactory.produce()
//        case is Cantata.Type:
//            return CantataCoffeeFactory.produce()
//        case is Cola.Type:
//            return ColaFactory.produce()
//        case is Cider.Type:
//            return CiderFactory.produce()
//        default:
//            return nil
//        }
//    }
//}
