//
//  SodaFactory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class SodaFactory: BeverageFactory {
    static func createBeverage(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiryTime: Date, calorie: Int, temperature: Int) -> Beverage? {
        
        switch brand {
        case "Coke" :
            return Coke(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, flavor: "콜라맛", acidConcentration: 15)
            
        case "Sprite" :
            return Sprite(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, flavor: "사이다맛", lemonContent: 3)
            
        case "Fanta" :
            return Fanta(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiryTime: expiryTime, calorie: calorie, temperature: temperature, flavor: "환타맛", color: "오렌지색")
        default :
            return nil
        }
    }
}
