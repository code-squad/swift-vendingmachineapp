//
//  Milk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

enum MilkType: String {
    case strawberry = "딸기우유"
    case banana = "바나나우유"
    case choco = "초코우유"
    case unknown = ""
}

class Milk: Beverage {
    
    override init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date) {
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class StrawberryMilk: Milk {
    private var type: MilkType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: MilkType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class ChocoMilk: Milk {
    private var type: MilkType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: MilkType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class BananaMilk: Milk {
    private var type: MilkType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: MilkType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}
