//
//  SampleBeverageMaker.swift
//  VendingMachineApp
//
//  Created by 김성현 on 14/08/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class SampleBeverageMaker {
    
    func sampleBeverages() -> [BeverageWithPhoto] {
        
        let topCoffee = Coffee(name: "TOP", price: 1000, photo: #imageLiteral(resourceName: "TOP"), brand: "맥심", packageSize: 275, beverageTemperature: 10, caffeine: 50)
        
        let cantata = Coffee(name: "칸타타", price: 1500, photo: #imageLiteral(resourceName: "Cantata"), brand: "롯데", packageSize: 500, beverageTemperature: 80, caffeine: 40)
        
        let strawberryMilk = Milk(name: "딸기 우유", price: 500, photo: UIImage(named: "Strawberry"), brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장")
        
        let chocolateMilk = Milk(name: "딸기 우유", price: 500, photo: UIImage(named: "Strawberry"), brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장")
        
        let cola = SoftDrink(name: "코카콜라", price: 2000, photo: #imageLiteral(resourceName: "Cocacola"), brand: "코카콜라", packageSize: 355, calorie: 152)
        
        let lemonlineDrink = SoftDrink(name: "칠성사이다", price: 1600, photo: #imageLiteral(resourceName: "ChilsungCider"), brand: "롯데", packageSize: 350, calorie: 155)
        
        return [topCoffee, cantata, strawberryMilk, chocolateMilk, cola, lemonlineDrink]
    }
}
