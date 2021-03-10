//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/10.
//

import Foundation

struct DrinkFactory {
    
    static func create(type: Drink.Type) -> Drink? {
        switch type {
        case is StrawberryMilk.Type:
            return StrawberryMilk(date: Date(), fat: 20, container: .box, hot: false, calorie: 300)
        case is ChocoMilk.Type:
            return ChocoMilk(date: Date(), fat: 50, cacao: .Original, hot: false, calorie: 350)
        case is CocaCola.Type:
            return CocaCola(date: Date(), isZero: false, flavor: .Original, hot: false, calorie: 500)
        case is Sprite.Type:
            return Sprite(date: Date(), isZero: false, flavor: .Original, hot: false, calorie: 550)
        case is Cantata.Type:
            return Cantata(date: Date(), caffein: 10, flavor: .Americano, hot: true, calorie: 220)
        case is Top.Type:
            return Top(date: Date(), caffein: 25, flavor: .SweetAmericano, hot: true, calorie: 120)
        default:
            return nil
        }
    }
}
