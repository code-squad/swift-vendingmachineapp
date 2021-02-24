//
//  Soda.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

enum SodaType: String {
    case coke = "콜라"
    case sprite = "사이다"
    case hwanta = "환타"
}

class Soda: Beverage {
    override init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date) {
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Coke: Soda {
    private var type: SodaType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: SodaType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Sprite: Soda {
    private var type: SodaType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: SodaType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Hwanta: Soda {
    private var type: SodaType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: SodaType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}
