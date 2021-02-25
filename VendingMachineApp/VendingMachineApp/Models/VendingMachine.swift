//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class VendingMachine {
    enum Coin: Int {
        case fifty = 50
        case hundred = 100
        case fivehundred = 500
        case thousand = 1000
        case fifvethousand = 5000
    }
    
    private var drinks: [Drink]
    private var credit: Int
    
    
    init(drinks: [Drink]) {
        self.drinks = drinks
        self.credit = 0
    }
    
    func show(handler: (Drink) -> Void) {
        drinks.forEach {
            handler($0)
        }
    }
    
    func insertCoin(coin: Coin) {
        credit += coin.rawValue
    }
}
