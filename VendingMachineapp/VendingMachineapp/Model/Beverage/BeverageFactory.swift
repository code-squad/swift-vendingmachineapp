//
//  BeverageFactory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

protocol BeverageFactory {
    static func createBeverage(manufacturer: String,
                               volume: Int,
                               price: Int,
                               brand: String,
                               manufactured: Date,
                               expiryTime: Date,
                               calorie: Int,
                               temperature: Int,
                               ofType: Beverage.Type) -> Beverage?
}
