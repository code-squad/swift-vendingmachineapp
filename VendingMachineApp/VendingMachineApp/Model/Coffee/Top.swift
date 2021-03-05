//
//  Top.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

enum CoffeeType: String, CaseIterable {
    case Americano = "Americano"
    case Caramel = "Caramel"
    case Latte = "Latte"
}

class Top: Coffee {
    
    private var coffeeType: CoffeeType
    
    init(coffeeType: CoffeeType,isDecaffeinated: Int,isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date, beverageType:BeverageType) {
        self.coffeeType = coffeeType
        super.init(isDecaffeinated: isDecaffeinated,isHot: isHot, isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate, beverageType: BeverageType.Coffee)
    }
}
