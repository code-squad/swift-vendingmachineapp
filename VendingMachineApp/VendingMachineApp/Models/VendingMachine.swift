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
    
    private var stock: Drinks
    private var credit: Int
    
    init() {
        self.stock = Drinks()
        self.credit = 0
    }
    
    init(drinks: Drinks) {
        self.stock = drinks
        self.credit = 0
    }
    
    func show(handler: (Drink) -> Void) {
        stock.show(handler: handler)
    }
    
    func insertCoin(coin: Coin) {
        credit += coin.rawValue
    }
    
    func append(_ drink: Drink) {
        stock.append(drink)
    }
    
    func append(drinks: [Drink]) {
        stock.append(drinks)
    }
    
    func possibleDrinks() -> Drinks {
        return stock.possibleDrinks(with: credit)
    }
    
    func nowCredit() -> Int {
        return credit
    }
}
