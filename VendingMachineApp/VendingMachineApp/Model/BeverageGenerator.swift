//
//  BeverageGenerator.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/07.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct BeverageGenerator {
    static func generateBeverage() -> [Beverage] {
        var beverages: [Beverage] = []
        
        beverages.append(CafeLatte())
        beverages.append(CafeLatte())
        beverages.append(Americano())
        beverages.append(Coke())
        beverages.append(Coke())
        beverages.append(Coke())
        beverages.append(LemonlimeDrink())
        beverages.append(StrawberryMilk())
        beverages.append(StrawberryMilk())
        beverages.append(ChocolateMilk())
        
        return beverages
    }
}
