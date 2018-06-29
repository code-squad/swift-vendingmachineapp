//
//  BeverageFactory.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 6. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct BeverageFactory {
    
    private var beverageSet = [Beverage]()
    
    init() {
        self.beverageSet.append(StrawberryMilk())
        self.beverageSet.append(StrawberryMilk())
        self.beverageSet.append(StrawberryMilk())
        self.beverageSet.append(BananaMilk())
        self.beverageSet.append(ChocoMilk())
        self.beverageSet.append(ChocoMilk())
        self.beverageSet.append(Coke())
        self.beverageSet.append(Coke())
        self.beverageSet.append(Coke())
        self.beverageSet.append(Sprite())
        self.beverageSet.append(Fanta())
        self.beverageSet.append(Top())
        self.beverageSet.append(Cantata())
        self.beverageSet.append(Cantata())
        self.beverageSet.append(Georgia())
        self.beverageSet.append(Georgia())
    }
    
    func setBeverage() -> [Beverage] {
        return beverageSet
    }
    
    
}
