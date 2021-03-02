//
//  MilkFactory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class MilkFactory: BeverageFactory {
    static func createBeverage(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int) -> Beverage? {
        
        switch brand {
        case "날마다딸기우유" :
            return StrawberryMilk(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, lowFat: 10, strawberryContent: 12)
            
        case "날마다초코우유" :
            return ChocoMilk(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, lowFat: 20, chocoContent: 15)
            
        case "날마다바나나우유" :
            return BananaMilk(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, lowFat: 10, bananaContent: 13)
        default :
            return nil
        }
    }
}
