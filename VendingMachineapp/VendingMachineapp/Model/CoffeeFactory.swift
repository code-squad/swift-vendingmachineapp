//
//  CoffeeFactory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class CoffeeFactory: BeverageFactory {
    static func createBeverage(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int) -> Beverage? {
        
        switch brand {
        case "top" :
            return Top(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, caffeineContent: 10, milkContent: 10)
            
        case "cantata" :
            return Cantata(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, caffeineContent: 15, coldBrew: true)
            
        case "georgia" :
            return Georgia(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, caffeineContent: 20, condensedMilkContent: 5)
        default :
            return nil
        }
    }
}
