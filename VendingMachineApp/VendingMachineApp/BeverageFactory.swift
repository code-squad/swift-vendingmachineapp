//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

protocol BeverageFactory {
    func produce() -> Beverage
}

class MilkFactory: BeverageFactory {
    func produce() -> Beverage {
        return Banana()
    }
}

class SoftDrinkFactory: BeverageFactory {
    func produce() -> Beverage {
        return Cola()
    }
}

class CoffeeFactory: BeverageFactory {
    func produce() -> Beverage {
        return TOP()
    }
}
