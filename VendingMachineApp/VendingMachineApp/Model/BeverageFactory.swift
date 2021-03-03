//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/03.
//

import Foundation

class BeverageFactory {
    private static var sharedBeverageFactory = BeverageFactory()
    
    class func shared() -> BeverageFactory {
        return sharedBeverageFactory
    }
    
    func getBeverage(DrinkType drinkType : Drink.Type) -> Drink {
        switch drinkType {
        case is ChocoMilk.Type:
            return ChocoMilk.init(brand: "서울우유", volume: 200, charge: 830, name: "초코우유", manufacturing: Date.init(timeIntervalSince1970: 0), expirationLimit: 3, chocolateContent: 8)
        case is StrawberryMilk.Type:
            return StrawberryMilk.init(brand: "서울우유", volume: 200, charge: 840, name: "딸기우유", manufacturing: Date.init(timeIntervalSince1970: 0), expirationLimit: 3, cochineal: true)
        case is Cola.Type:
            return Cola.init(brand: "CoCa-Cola", volume: 215, charge: 574, name: "코카콜라제로", manufacturing: Date.init(), package : Materials.steel, sugarContent : 0) //제조일자 : now
        case is Cider.Type:
            return Cider.init(brand: "칠성", volume: 255, charge: 630, name: "칠성-사이다", manufacturing: Date.init(), package : Materials.steel, calories : 327) //제조일자 : now
        case is TOP.Type:
            return TOP.init(brand: "Maxim", volume: 275, charge: 980, name: "TOP 스위트 아메리카노", manufacturing: Date.init(), caffeine : 123.45, temperature: 73.3)
        case is Cantata.Type:
            return Cantata.init(brand: "롯데칠성음료", volume: 430, charge: 1400, name: "칸타타 콘트라베이스", manufacturing: Date.init(), caffeine : nil, bean: .arabica)
        default:
            return Drink.init(brand: "nil", volume: 0, charge: 0, name: "nil", manufacturing: Date.init(timeIntervalSince1970: 0))
        }
    }
}
