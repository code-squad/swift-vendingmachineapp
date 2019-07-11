//
//  StockPrintable.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/3/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

protocol StockPrintable {
    func printStock(handler: (DrinkMenu, Int)->())
}

protocol BalancePrintable {
    func printBalance(handler: (Money)->())
}

protocol SellDrinkPrintable {
    func printSellDrink(handler: (Int, DrinkMenu)->())
    func printSellDrinkList(handler: (Int, DrinkMenu)->())
}

protocol PieGraphDrawable {
    func getSegmentsValueTotal() -> Float
    func getSegmentsCount() -> Int
    func drawSegment(index: Int, handler: (DrinkMenu, Float) -> ())
}
