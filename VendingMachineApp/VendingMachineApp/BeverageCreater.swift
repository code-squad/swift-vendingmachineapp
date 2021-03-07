//
//  BeverageCreater.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/03.
//

import UIKit

class BeverageCreater : BeverageFactory {
    
    func makeBeverage(beveragetype : Beverage.Type, _ manufactured: Date) -> Beverage{
        var beverage : Beverage? = nil
        switch beveragetype {
        case is BananaMilk.Type:
            beverage = BananaMilk.init(sugarContent: 30, lowfat: false, brand: "서울우유", volume: 180, price: 2100, name: "바나나는 원래 하얗다", manufactured: manufactured, temperature: 10, kcal: 80)
        case is StrawBerryMilk.Type:
            beverage = StrawBerryMilk.init(StrawBerryContent: 30, lowfat: false, brand: "서울우유", volume: 180, price: 2200, name: "진짜 리얼 딸기 우유", manufactured: manufactured, temperature: 10, kcal: 80)
        case is Cider.Type:
        beverage = Cider.init(appleContent: 30, sugarContent: 0, brand: "와인사랑", volume: 355, price: 11000, name: "SOMERSBY", manufactured: manufactured, temperature: 1, kcal: 180)
        case is Coke.Type:
            beverage = Coke.init(product: .zero, sugarContent: 0, brand: "코카콜라", volume: 180, price: 3100, name: "코카콜라제로", manufactured: manufactured, temperature: 1, kcal: 210)
        case is Hot6.Type:
            beverage = Hot6.init(taurine: true, caffeineContent: 30, brand: "코카콜라", volume: 180, price: 1900, name: "HOT6", manufactured: manufactured, temperature: 9, kcal: 20)
        case is Monster.Type:
            beverage = Monster.init(glutamineContent: 10, caffeineContent: 30, brand: "코카콜라", volume: 180, price: 2100, name: "몬스터", manufactured: manufactured, temperature: 5, kcal: 30)
        case is CaffeMocha.Type:
            beverage = CaffeMocha.init(cream: true, caffeineContent: 30, brand: "스타벅스", volume: 236, price: 3600, name: "카페모카", manufactured: manufactured, temperature: 90, kcal: 330)
        case is CaffeeLatte.Type:
            beverage = CaffeeLatte.init(sugarContent: 30, caffeineContent: 30, brand: "스타벅스", volume: 236, price: 3500, name: "카페라떼", manufactured: manufactured, temperature: 90, kcal: 330)
        default:
            //dummyCan? -> return Money?
            break
        }
        return beverage!
    }
}
