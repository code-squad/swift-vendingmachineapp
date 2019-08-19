//
//  SampleBeverageMaker.swift
//  VendingMachineApp
//
//  Created by 김성현 on 14/08/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class SampleBeverageMaker {
    
    func sampleBeverages() -> [BeverageItem] {
        
        let topCoffee = CoffeeItem(name: "TOP", price: 1000, brand: "맥심", packageSize: 275, beverageTemperature: 10, caffeine: 50)
        
        let cantata = CoffeeItem(name: "칸타타", price: 1500, brand: "롯데", packageSize: 500, beverageTemperature: 80, caffeine: 40)
        
        let strawberryMilk = MilkItem(name: "딸기 우유", price: 500, brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장")
        
        let chocolateMilk = MilkItem(name: "딸기 우유", price: 500, brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장")
        
        let cola = SoftDrinkItem(name: "코카콜라", price: 2000, brand: "코카콜라", packageSize: 355, calorie: 152)
        
        let lemonlineDrink = SoftDrinkItem(name: "칠성사이다", price: 1600, brand: "롯데", packageSize: 350, calorie: 155)
        
        return [topCoffee, cantata, strawberryMilk, chocolateMilk, cola, lemonlineDrink]
    }
}
