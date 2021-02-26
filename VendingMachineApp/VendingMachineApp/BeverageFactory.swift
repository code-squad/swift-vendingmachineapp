//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

protocol DrinkFactory {
    func produce(brand: String, volume: Int, price: Int, name: String, date: Date) -> Beverage
}

class MilkFactory: DrinkFactory {
    func produce(brand: String, volume: Int, price: Int, name: String, date: Date) -> Beverage {
        return Milk(brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class SoftDrinkFactory: DrinkFactory {
    func produce(brand: String, volume: Int, price: Int, name: String, date: Date) -> Beverage {
        return SoftDrink(brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class CoffeeFactory: DrinkFactory {
    func produce(brand: String, volume: Int, price: Int, name: String, date: Date) -> Beverage {
        return Coffee(brand: brand, volume: volume, price: price, name: name, date: date)
    }
}
