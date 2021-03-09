//
//  BeverageFactory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

protocol BeverageFactoryable {
    static func createBeverage(manufacturer: String,
                               volume: Int,
                               price: Int,
                               brand: String,
                               manufactured: Date,
                               expiry: Date,
                               calorie: Int,
                               temperature: Int,
                               ofType: Beverage.Type) -> Beverage?
}

class BeverageFactory: BeverageFactoryable {
    static func createBeverage(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expiry: Date, calorie: Int, temperature: Int, ofType: Beverage.Type) -> Beverage? {
        
        return ofType.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expiry: expiry, calorie: calorie, temperature: temperature)
    }
}
