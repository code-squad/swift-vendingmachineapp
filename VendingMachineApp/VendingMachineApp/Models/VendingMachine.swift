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
    private var credit: Money
    private var log: SalesLog

    init(drinks: Drinks) {
        self.stock = drinks
        self.credit = Money()
        self.log = SalesLog()
    }
    
    convenience init() {
        self.init(drinks: Drinks())
    }
    
    func show(handler: (Drink) -> Void) {
        stock.show(handler: handler)
    }
    
    func insertCoin(coin: Coin) {
        credit.deposit(unit: coin.rawValue)
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
    
    func nowCredit() -> Money {
        return credit
    }
    
    func hotDrinks() -> Drinks {
        return stock.hotDrinks()
    }
    
    func lowCalorieDrinks() -> Drinks {
        return stock.lowCalorieDrinks()
    }
    
    func validateDrinks(when date: Date) -> Drinks {
        return stock.validateDrinks(when: date)
    }
    
    private func canBuy(with drink: Drink) -> Bool {
        return credit > drink.price
    }
    
    private func hasDrink(with drink: Drink) -> Bool {
        return stock.hasDrink(with: drink)
    }
    
    func buy(with drink: Drink) -> Drink? {
        if !hasDrink(with: drink) || !canBuy(with: drink){
            return nil
        }
        credit -= drink.price
        update(with: drink)
        return drink
    }
    
    private func update(with drink: Drink) {
        logUpdate(drink)
        dictionaryUpdate(drink)
    }
    
    private func dictionaryUpdate(_ drink: Drink) {
        stock.diconaryUpdate(with: drink)
    }
    
    private func logUpdate(_ drink: Drink) {
        log.update(drink)
    }
    
    func showLog() -> [String] {
        return log.get()
    }
}
