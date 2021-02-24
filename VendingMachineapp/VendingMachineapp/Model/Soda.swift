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

class Coke: Beverage {
    private var name: SodaType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, name: SodaType) {
        self.name = name
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Sprite: Beverage {
    private var name: SodaType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, name: SodaType) {
        self.name = name
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Hwanta: Beverage {
    private var name: SodaType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, name: SodaType) {
        self.name = name
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}
