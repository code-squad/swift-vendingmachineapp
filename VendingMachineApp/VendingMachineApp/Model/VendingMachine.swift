//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

struct VendingMachine {
    private var drink : Drink
    private var payment : Payment
    
    init() {
        self.drink = Drink()
        self.payment = Payment()
    }
    
    func showBeverageList(handler : (Beverage) -> Void) {
        drink.showBeverageList {
            handler($0)
        }
    }
    
    func putPayMoney(money : Int) {
        payment.increaseMoney(money: money)
    }
    
    func addBevergeStock(beverage : Beverage) {
        drink.addStock(beverage : beverage)
    }
}
