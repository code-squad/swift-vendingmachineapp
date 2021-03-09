//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

struct VendingMachine {
    
    private var drinks: Drinks
    private var payment : Payment
    
    init(drinks: Drinks, payment: Payment) {
        self.drinks = drinks
        self.payment = payment
    }
    
    //MARK: 현재 자판기 음료수 출력
    func showVendingMachine(handler: (Drink) -> ()) {
        let printDrinks = drinks.showNowDrinkList()
        printDrinks.forEach {
            handler($0)
        }
    }
    
    //MARK: 현재 금액으로 구매가능한 음료수 목록 메소드
    mutating func showPurchasableDrinks() -> [Drink]{
        let nowMoney = payment.nowMoney()
        return drinks.getPurchasableDrinks(with: nowMoney)
    }
    
    //MARK: 음료수 구매
    mutating func purcahseDrink(drink: Drink){
        let nowMoney = payment.nowMoney()
        var canBuyDrinks = drinks.getPurchasableDrinks(with: nowMoney)
        if let firstIndex = canBuyDrinks.firstIndex(of: drink){
            canBuyDrinks.remove(at: firstIndex)
            drinks.removeDrink(at: drink)
<<<<<<< HEAD
            drinks.addPurchasedList(with: drink)
=======
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
        }
    }
}

