//
//  BeverageMaker
//  VendingMachineApp
//
//  Created by yuaming on 23/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import Foundation

struct BeverageMaker {
    static func newInstances(_ menu: BeverageMenu) -> Beverage {
        switch menu {
        case .bananaMilk:
            return produceBananaMilk()
        case .cocaCola:
            return produceCocaCola()
        case .georgia:
            return produceGeorgia()
        case .pepsi:
            return producePepsi()
        case .top:
            return produceTop()
        case .strawberryMilk:
            return produceStrawberryMilk()
        }
    }

    private static func produceTop() -> TOP {
        return TOP(brand: "맥심", volume: 275, price: Money(1800), productName: "TOP 스위트아메리카노", expiryDate: DateUtility.subtractDays(1), calorie: 48, isHot: true)
    }

    private static func producePepsi() -> Pepsi {
        return Pepsi(brand: "펩시콜라", volume: 355, price: Money(1200), productName: "펩시",
                     expiryDate: DateUtility.subtractDays(7), calorie: 275)
    }

    private static func produceGeorgia() -> Georgia {
        return Georgia(brand: "코카콜라", volume: 240, price: Money(1100), productName: "조지아 오리지널", expiryDate: DateUtility.addDays(1), calorie: 94, isHot: false)
    }

    private static func produceCocaCola() -> CocaCola {
        return CocaCola(brand: "코카콜라", volume: 500, price: Money(1430), productName: "코카콜라",
                        expiryDate: DateUtility.addDays(5), calorie: 250)
    }

    private static func produceBananaMilk() -> BananaMilk {
        return BananaMilk(brand: "빙그레", volume: 250, price: Money(1500), productName: "바나나우유",
                          expiryDate: DateUtility.addDays(7), calorie: 300)
    }

    private static func produceStrawberryMilk() -> StrawberryMilk {
        return StrawberryMilk(brand: "빙그레", volume: 355, price: Money(1200), productName: "딸기우유",
                              expiryDate: DateUtility.addDays(3), calorie: 275)
    }
}
