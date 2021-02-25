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
    
    private var stock: [Drink]
    private var credit: Int
    
    init() {
        self.stock = []
        self.credit = 0
    }
    
    init(drinks: [Drink]) {
        self.stock = drinks
        self.credit = 0
    }
    
    func show(handler: (Drink) -> Void) {
        stock.forEach {
            handler($0)
        }
    }
    
    func insertCoin(coin: Coin) {
        credit += coin.rawValue
    }
    
    func append(drink: Drink) {
        stock.append(drink)
    }
    
    func append(drinks: [Drink]) {
        drinks.forEach {
            stock.append($0)
        }
    }
}
