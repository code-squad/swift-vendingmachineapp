//
//  OutPut.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/28.
//

import Foundation

class DrinkFactory: DrinkProduceable {    
    static public func makeDrink(of type: Drink.Type, manufactured: Date = Date()) -> Drink? {
        guard let productType = type as? Productization.Type else { return nil }
        switch productType {
        case is BlueBottleColdBrew.Type: return BlueBottleColdBrew(flavor: .bold, manufactured: manufactured)
        case is StarbucksColdBrew.Type: return StarbucksColdBrew(flavor: .black, manufactured: manufactured)
        case is SeoulStrawberryMilk.Type: return SeoulStrawberryMilk(isWithStraw: true, manufactured: manufactured)
        case is BingBananaMilk.Type: return BingBananaMilk(target: .all, manufactured: manufactured)
        case is Sanpellegrino.Type: return Sanpellegrino(isPackageRenewaled: true, manufactured: manufactured)
        case is Fanta.Type: return Fanta(flavor: .orange, manufactured: manufactured)
        default: return nil
        }
    }

    static public func makeDrink(of name: String, manufactured: Date = Date()) -> Drink? {
        guard let drinkType = findType(name: name) else { return nil }
        return makeDrink(of: drinkType, manufactured: manufactured)
    }
}

extension DrinkFactory {
    static func findType(name: String) -> Drink.Type? {
        switch name {
        case "BlueBottle Cold Brew(Bold)":
            return BlueBottleColdBrew.self
        case "Fanta Orange":
            return Fanta.self
        case "빙그레 바나나우유":
            return BingBananaMilk.self
        case "서울 우유 딸기맛":
            return SeoulStrawberryMilk.self
        case "Sanpellegrino":
            return Sanpellegrino.self
        case "StarBucks Cold Brew(Black)":
            return StarbucksColdBrew.self
        default:
            return nil
        }
    }
}
