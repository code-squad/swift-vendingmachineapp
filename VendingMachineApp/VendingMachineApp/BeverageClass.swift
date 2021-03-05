//
//  BeverageClass.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class Milk: Beverage {
    
    enum MilkSKU: String {
        case plain, strawberry, choco
    }
    
    private var milkSKU: MilkSKU
    
    init(manufacturer: String, volume: Int, price: Int, skuName: String, manufactureDate: Date, milkSKU: MilkSKU) {
        self.milkSKU = milkSKU
        super.init(manufacturer: manufacturer, volume: volume, price: price, skuName: skuName, manufactureDate: manufactureDate)
    }
    
}

class Soda: Beverage {
    
    enum SodaSKU: String {
        case drPepper, fanta, lemonSoda
    }
    
    private var sodaSKU: SodaSKU
    
    init(manufacturer: String, volume: Int, price: Int, skuName: String, manufactureDate: Date, sodaSKU: SodaSKU) {
        self.sodaSKU = sodaSKU
        super.init(manufacturer: manufacturer, volume: volume, price: price, skuName: skuName, manufactureDate: manufactureDate)
    }
    
}

class Coffee: Beverage {
    
    enum CoffeeSKU: String {
        case top, cantata, georgia
    }
    
    private var coffeeSKU: CoffeeSKU
    
    init(manufacturer: String, volume: Int, price: Int, skuName: String, manufactureDate: Date, coffeeSKU: CoffeeSKU) {
        self.coffeeSKU = coffeeSKU
        super.init(manufacturer: manufacturer, volume: volume, price: price, skuName: skuName, manufactureDate: manufactureDate)
    }
    
}

