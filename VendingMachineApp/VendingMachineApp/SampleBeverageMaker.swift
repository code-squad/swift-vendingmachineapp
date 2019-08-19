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
        
        let topCoffee = CoffeeItem(name: "TOP", price: 1000, brand: "맥심", packageSize: 275, caffeine: 50, defaultBeverage: Beverage(beverageTemperature: 60, expirationPeriod: Date.timeInterval(fromDays: 30), manufactureDates: Date()))
        
        let cantata = CoffeeItem(name: "칸타타", price: 1500, brand: "롯데", packageSize: 500, caffeine: 40, defaultBeverage: Beverage(beverageTemperature: 30, expirationPeriod: Date.timeInterval(fromDays: 45), manufactureDates: Date()))
        
        let strawberryMilk = MilkItem(name: "딸기 우유", price: 500, brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장", defaultBeverage: Beverage(beverageTemperature: 10, expirationPeriod: Date.timeInterval(fromDays: 14), manufactureDates: Date()))
        
        let chocolateMilk = MilkItem(name: "딸기 우유", price: 500, brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장", defaultBeverage: Beverage(beverageTemperature: 15, expirationPeriod: Date.timeInterval(fromDays: 14), manufactureDates: Date()))
        
        let cola = SoftDrinkItem(name: "코카콜라", price: 2000, brand: "코카콜라", packageSize: 355, calorie: 152, defaultBeverage: Beverage(beverageTemperature: 5, expirationPeriod: Date.timeInterval(fromDays: 90), manufactureDates: Date()))
        
        let lemonlineDrink = SoftDrinkItem(name: "칠성사이다", price: 1600, brand: "롯데", packageSize: 350, calorie: 155, defaultBeverage: Beverage(beverageTemperature: 5, expirationPeriod: Date.timeInterval(fromDays: 90), manufactureDates: Date()))
        
        return [topCoffee, cantata, strawberryMilk, chocolateMilk, cola, lemonlineDrink]
    }
}
