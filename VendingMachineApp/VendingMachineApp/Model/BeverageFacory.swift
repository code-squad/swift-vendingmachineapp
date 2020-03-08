//
//  BeverageFacory.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/03/07.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class BeverageFactory {
    func makeBeverage(number: VendingMachine.BeverageNumbers) -> Beverage {
        switch number {
        case .ChocolateMilk:
            return ChocolateMilk(brand: "SeoulMilk",
                                 capacity: 300,
                                 price: Price(1000),
                                 name: "ChocolateMilk",
                                 manufacturingDate: Date(),
                                 calorie: 195,
                                 temperature: .Cool,
                                 beverageIndex: .ChocolateMilk,
                                 farmCode: Milk.FarmCode(index: Int.random(in: 0..<Milk.FarmCode.allCases.count)),
                                 package: .paper)
        case .StrawberryMilk:
            return StrawberryMilk(brand: "SeoulMilk",
                                  capacity: 300,
                                  price: Price(1000),
                                  name: "StrawberryMilk",
                                  manufacturingDate: Date(),
                                  calorie: 195,
                                  farmCode: Milk.FarmCode(index: Int.random(in: 0..<Milk.FarmCode.allCases.count)),
                                  temperature: .Cool,
                                  beverageIndex: .StrawberryMilk,
                                  juiceContent: 2)
        case .Coke:
            return Coke(brand: "CocaCola",
                        capacity: 355,
                        price: Price(2000),
                        name: "Coke",
                        manufacturingDate: Date(),
                        calorie: 160,
                        temperature: .Cool,
                        beverageIndex: .Coke,
                        carbonicAcid: 20)
            
        case .Cider:
            return Cider(brand: "CocaCola",
                         capacity: 355,
                         price: Price(2000),
                         name: "Cider",
                         manufacturingDate: Date(),
                         calorie: 168,
                         temperature: .Cool,
                         beverageIndex: .Cider,
                         taste: Cider.Taste(index: Int.random(in: 0..<Cider.Taste.allCases.count)))
            
        case .Georgia:
            return Georgia(brand: "CocaCola",
                           capacity: 240,
                           price: Price(1500),
                           name: "GeorGia",
                           manufacturingDate: Date(),
                           calorie: 94,
                           temperature: .Hot,
                           beverageIndex: .Georgia,
                           decaffeinated: false,
                           black: false)
            
        case .TOP:
            return TOP(brand: "Maxim",
                       capacity: 275,
                       price: Price(2000),
                       name: "TOP",
                       manufacturingDate: Date(),
                       calorie: 48,
                       temperature: .Hot,
                       beverageIndex: .TOP,
                       decaffeinated: false,
                       beanOrigin: TOP.BeanOrigin.init(index: Int.random(in: 0..<TOP.BeanOrigin.allCases.count)))
        }
    }
}
